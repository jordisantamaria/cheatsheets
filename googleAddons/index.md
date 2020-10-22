# Google Slides

Los scripts pueden crearse en https://script.google.com/home y ser ejecutados
o incluirse en el propio fichero de drive "ej google docs",iendo a
```
herramientas -> editor de secuencia de comandos
```

## Api

- SlidesApp

- Presentation

- Page
  - Page types:
    - Slide: Es una diapositiva de la presentacion
    - Master
    - Layout
    - NotesPage
    - NotesMasters

- PageElement
  - PageElement types:
    - Shape: Cuadros de formas que pueden contener texto
    - Line
    - Image
    - SheetsChart
    - etc..
    
## Seleccionando elementos

Devuelve un elemento de tipo selectionType, segun el elemento que has 
seleccionado

```javascript
var selection = SlidesApp.getActivePresentation().getSelection();
var selectionType = selection.getSelectionType();
```
- Nada seleccionado: Devuelve una Page
- Elemento seleccionado: Devuelve un PageElement
- Texto seleccionado: Devuelve un TextRange

## Insertando elementos

- Insertar una forma: 
```javascript
var slide = SlidesApp.getActivePresentation().getSlides()[0];
var shape = slide.insertShape(SlidesApp.ShapeType.TEXT_BOX, 100, 200, 300, 60);
```

- Insertar texto:

```javascript
var textRange = shape.getText();
textRange.setText('Hello world!');
textRange.clear(6, 11);
textRange.insertText(6, 'galaxy');
```

- Dando estilos al texto

```javascript
var insertedText = textRange.appendText('world!');
insertedText.getTextStyle()
    .setBold(true)
    .setLinkUrl('www.example.com')
    .setForegroundColor('#ff0000');
```

- Dando estilos al paragrafo (text-alignment, line-spacing, etc...)
```javascript
var textRange = shape.getText();
textRange.setText('Paragraph 1\nParagraph2\nParagraph 3\nParagraph 4');
var paragraphs = textRange.getParagraphs();
for (var i = 0; i < 3; i++) {
  var paragraphStyle = paragraphs[i].getRange().getParagraphStyle();
  paragraphStyle.setParagraphAlignment(SlidesApp.ParagraphAlignment.CENTER);
}
```


# Macro

Para grabar un conjunto de acciones en un boton, que al ejecutarlo se realicen todas.

## Manual

Ir a **Herramientas -> Macros -> registrar macro**

Haz las acciones y darle a guardar

La macro sera accessible en **Herramientas -> Macros**

## Codigo

Ir a **Herramientas -> Editor de scripts**

Se ha autogenerado el codigo para la macro creada.

# Custom functions

Para usar en excel tipo =USDTOCHF(H8)

Generar docs con hints al usarla, con @customfunction facilitamos autocomplete

```javascript
/**
 * Converts US dollars to Swiss francs.
 * 
 * @param {number} dollars The total number of dollars.
 * @return {number} swissFrancs The converted total of Swiss francs.
 * @customfunction
 */
function USDTOCHF(dollars){
  var swissFrancs = dollars * .99; 
  return swissFrancs;
}
```

## Con datos dinamicos by api

```javascript
function USDTOCHF(dollars){
  // Gets a cache that is common to all users of the script.
  var cache = CacheService.getScriptCache();

  // Accesses the memory location (rates.CHF) of the script cache. 
  var rate = cache.get('rates.CHF');

  // If a cache miss occurs, the program fetches the current
  // CHF rate from an API and stores that rate in the cache
  // for later convenience. 
  if (!rate) {
    var response =
UrlFetchApp.fetch('https://api.exchangeratesapi.io/latest?base=USD');
    var result = JSON.parse(response.getContentText());
    rate = result.rates.CHF;
    cache.put('rates.CHF', rate);
  }
  // Converts dollars to CHF according to the latest rate. 
  var swissFrancs = dollars * rate;
  // Returns the CHF value. 
  return 'CHF' + swissFrancs;
}
```

# Google Sheets

## Spreadsheet service

1. SpreadsheetApp: Main service, da info general de las hojas de calculo
2. Spreadsheet: Para modificar los datos de la hoja de calculo
    Por ejemplo cambiar el nombre de la hoja de calculo
3. Sheet: Una pagina individual "tabs"
    Acceder a los datos y manipularlos
    
4. Range: El grupo de casillas a las que aplicar una funcion
    Hacer operaciones con grupos de datos

```javascript
function renameSpreadsheet() {
  var mySS = SpreadsheetApp.getActiveSpreadsheet();
  mySS.rename("2017 Avocado Prices in Portland, Seattle");
}

function duplicateAndOrganizeActiveSheet() {
  var mySS = SpreadsheetApp.getActiveSpreadsheet();
  var duplicateSheet = mySS.duplicateActiveSheet();

  // Change the name of the new sheet.
  duplicateSheet.setName("Sheet_" + duplicateSheet.getSheetId());

  // Format the new sheet.
  duplicateSheet.autoResizeColumns(1, 5);
  duplicateSheet.setFrozenRows(2);

  // Move column F to column C.
  var myRange = duplicateSheet.getRange("F2:F");
  myRange.moveTo(duplicateSheet.getRange("C2"));

  // Sort all the data using column C (Price information).
  myRange = duplicateSheet.getRange("A3:D55");
  myRange.sort(3);
}
```

## Menus

Crear un menu con un item que al hacer click se ejecuta
la funcion loadBookList

```javascript
/**
 * A special function that runs when the spreadsheet is first
 * opened or reloaded. onOpen() is used to add custom menu
 * items to the spreadsheet.
 */
function onOpen() {
  var ui = SpreadsheetApp.getUi();
  ui.createMenu('Book-list')
    .addItem('Load Book-list', 'loadBookList')
    .addSeparator()
    .addItem(
      'Separate title/author at first comma', 'splitAtFirstComma')
    .addToUi();
}
```




# Clasp cli

Cli para hacer deploy de proyectos GAS

Para poder usar la cli es necesario primero hacer login:

```
clasp login
```

create project: clasp create

push project: clasp push
