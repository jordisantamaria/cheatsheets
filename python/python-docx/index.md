https://python-docx.readthedocs.io/en/latest/user/quickstart.html

# Open empty document

```
from docx import Document
document = Document()
```

# Save document

```
from docx import Document

document = Document()
document.save('test.docx')
```


# Open an existing document

```
document = Document('existing-document-file.docx')
document.save('new-file-name.docx')
```


# add paragraph

```
paragraph = document.add_paragraph('Lorem ipsum dolor sit amet.')
```

# add before paragraph

Its possible to use the returned element as reference to add before it.

```
prior_paragraph = paragraph.insert_paragraph_before('Lorem ipsum')
```
