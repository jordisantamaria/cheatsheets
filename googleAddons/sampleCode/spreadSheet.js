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

