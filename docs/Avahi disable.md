# Disable or enable Avahi

## Why Avahi is disabled

This system uses NetworkManager with `systemd-resolved`. The resolver already handles normal DNS, per-interface DNS routing, and multicast DNS (mDNS) for `.local` names.

Running both `avahi-daemon` and the mDNS responder in `systemd-resolved` caused Avahi to report:

```text
Detected another IPv4/IPv6 mDNS stack running on this host.
This makes mDNS unreliable and is thus not recommended.
```

For this machine, `systemd-resolved` is the preferred mDNS provider because:

- NetworkManager is already configured to use it.
- `/etc/resolv.conf` sends queries to its `127.0.0.53` stub resolver.
- `/etc/nsswitch.conf` uses the `resolve` module.
- There are no custom Avahi services being published.
- CUPS is not running, and no active application was found using the Avahi client library.

The Avahi package can remain installed because other packages may require its libraries. Only its daemon and activation socket need to be disabled.

## Disable Avahi permanently

Stop Avahi now and prevent service, socket, and D-Bus activation on later boots:

```bash
sudo systemctl disable --now avahi-daemon.socket avahi-daemon.service
```

Verify the result:

```bash
systemctl is-enabled avahi-daemon.service avahi-daemon.socket
systemctl is-active avahi-daemon.service avahi-daemon.socket
```

Expected output:

```text
disabled
disabled
inactive
inactive
```

Confirm that `systemd-resolved` is active and still provides mDNS:

```bash
systemctl is-active systemd-resolved.service
resolvectl status
```

`systemd-resolved` should be `active`, and the applicable network interface should show `+mDNS`.

## Enable Avahi again

If an application—commonly older network-printer or service-discovery software—specifically requires Avahi, enable and start both units:

```bash
sudo systemctl enable --now avahi-daemon.socket avahi-daemon.service
```

Do not leave mDNS responding enabled in both Avahi and `systemd-resolved`. If Avahi must handle mDNS, disable it in resolved with a drop-in such as:

```ini
# /etc/systemd/resolved.conf.d/10-disable-mdns.conf
[Resolve]
MulticastDNS=no
```

Then apply the change:

```bash
sudo systemctl restart systemd-resolved.service avahi-daemon.service
```

To switch back to `systemd-resolved`, disable Avahi again, remove or reverse that drop-in, and restart `systemd-resolved`.
