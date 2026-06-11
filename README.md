# linux-docs
My linux documentation (notes)

## On first run do this from bash
python -m venv .venv
source .venv/bin/activate
pip install mkdocs-material


## Subsequent runs
Enable venv first (from bash)
source .venv/bin/activate


Check locally
mkdocs serve


Deploy while in venv using 
./deploy_docs.sh
