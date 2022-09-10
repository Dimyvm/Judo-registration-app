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

  return ContentService.createTextOutput(JSON.stringify(data)).setMimeType(ContentService.MimeType.JSON);
}

function doPost(request){
  
  // Open Google Sheet using ID
  var Aanwezigheden = SpreadsheetApp.openById("1-VzMg51790mnkf07VkXG1WBMu5oFLgBvFLhKAP2eWh8").getSheetByName('Aanwezigheden');
  var result = {"status": "SUCCESS"};
    try{
      // convert the event data to a JSON object
      const params = JSON.parse(request.postData.contents);

      // Get all Parameters 
      var registrationDate = params.registrationDateTime.split(' ')[0]; //Date 
      var registrationTime = params.registrationDateTime.split(' ')[1].substring(0, 8); //Time
      var group = params.trainingEvent.group;
      var detail = params.trainingEvent.detail;
      var uurStart = params.trainingEvent.dateTimeStart.split(' ')[1].substring(0, 8);
      var uurEinde = params.trainingEvent.dateTimeEnd.split(' ')[1].substring(0, 8);
      var datumStart = params.trainingEvent.dateTimeStart.split(' ')[0];
      var datumEinde = params.trainingEvent.dateTimeEnd.split(' ')[0];
      var voornaam = params.member.surName;
      var achternaam = params.member.name;


      // Append data on Google Sheet
      var rowData = Aanwezigheden.appendRow([registrationDate,registrationTime ,group, detail, uurStart, uurEinde, datumStart, datumEinde, voornaam, achternaam  ]);
      
    }catch(exc){
      // If error occurs, throw exception
      result = {"status": "FAILED", "message": exc};
    }

    // Return result
    return ContentService.createTextOutput(JSON.stringify(result)).setMimeType(ContentService.MimeType.JSON);
    
}

