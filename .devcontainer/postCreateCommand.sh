echo 'export PYTHON=/home/codespace/.python/current/bin/python' >> ~/.bashrc
export PYTHON=/home/codespace/.python/current/bin/python
npx --yes playwright install-deps
python -m pip install --user -r requirements.txt
python -m Browser.entry init