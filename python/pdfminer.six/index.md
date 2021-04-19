pdfminer is deprecated, so .six is the one used.
https://pdfminersix.readthedocs.io/en/latest/index.html

# Install

```
pip install pdfminer.six
```

# From console

## pdf2txt.py

Read all pdf file text
```
pdf2txt.py example.pdf
```

# dumppdf.py

Can be used to extract the internal structure from a PDF

````dumppdf.py -a example.pdf````

```
<pdf><object id="1">
...
</object>
...
</pdf>
```

# From python

To show pdf file text

```
from pdfminer.high_level import extract_text
text = extract_text('python.pdf')
print(text)
print(repr(text))
```
