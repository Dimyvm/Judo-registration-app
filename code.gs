function doGet(request){

  var sheetTrainings = SpreadsheetApp.openById("1-VzMg51790mnkf07VkXG1WBMu5oFLgBvFLhKAP2eWh8").getSheetByName("Trainingen");
  var sheetLeden = SpreadsheetApp.openById("1-VzMg51790mnkf07VkXG1WBMu5oFLgBvFLhKAP2eWh8").getSheetByName("Leden");
  var trainingsValues =  sheetTrainings.getDataRange().getValues();
  var ledenValues =  sheetLeden.getDataRange().getValues();

  var data = {};
  var trainingsList = []; 
  var ledenList = [];

  for(var i=1; i<trainingsValues.length;  i++ ){
    var feedback = {};
    feedback["Groep"] = trainingsValues[i][0];
    feedback["Detail"] = trainingsValues[i][1];
    feedback["datum start"] = trainingsValues[i][2];
    feedback["datum einde"] = trainingsValues[i][3];
    feedback["uur start"] = trainingsValues[i][4];
    feedback["uur einde"] = trainingsValues[i][5];
  
    trainingsList.push(feedback);
  }
  data["Trainings"] = trainingsList;

  for(var i=1; i<ledenValues.length;  i++ ){
    var feedback = {};
    feedback["Voornaam"] = ledenValues[i][0];
    feedback["Achternaam"] = ledenValues[i][1];
    feedback["Geboortedatum"] = ledenValues[i][2];
    feedback["Groep"] = ledenValues[i][3];

    ledenList.push(feedback);
  }
  data["Leden"] = ledenList;


  console.log(data);
  return ContentService.createTextOutput(JSON.stringify(data)).setMimeType(ContentService.MimeType.JSON);
}

function doPost(request){
  // Open Google Sheet using ID
  var sheet = SpreadsheetApp.openById("1-VzMg51790mnkf07VkXG1WBMu5oFLgBvFLhKAP2eWh8").getSheetByName('Aanwezigheden');
  var result = {"status": "SUCCESS"};
  try{
    // Get all Parameters
    var voornaam = request.parameter.voornaam;
    var achternaam = request.parameter.achternaam;
    var leeftijd = request.parameter.leeftijd;
    var datum = request.parameter.datum;

    // Append data on Google Sheet
    var rowData = sheet.appendRow([voornaam, achternaam, leeftijd, datum]);

  }catch(exc){
    // If error occurs, throw exception
    result = {"status": "FAILED", "message": exc};
  }

  // Return result
  return ContentService
  .createTextOutput(JSON.stringify(result))
  .setMimeType(ContentService.MimeType.JSON);
}

