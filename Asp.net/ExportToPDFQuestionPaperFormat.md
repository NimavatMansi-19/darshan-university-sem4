# Export to Pdf in Question Paper Format Function in ASP.NET Core

This function exports data from a database into an Pdf file using the `iTextSharp.LGPLv2.Core` library. The Pdf file includes Question and Option  with correct answer from a stored procedure.

## Function: `ExportToPDFQuestionPaperFormat`

### Description

The `ExportToPDFQuestionPaperFormat` function retrieves data from the database using a stored procedure (`PR_MST_Question_SelectAll`) and exports it to an Pdf file. It uses the `iTextSharp.LGPLv2.Core` library to create the Pdf file, with the file returned as a downloadable response.

### Prerequisites

1. **iTextSharp.LGPLv2.Core NuGet Package**  
   Ensure the `iTextSharp.LGPLv2.Core` library is installed in your project:
   ```bash
   Install-Package iTextSharp.LGPLv2.Core

##  Write Logic to Download Excel File in the List Page Action Method

In the action method for your list page, add the following logic to fetch data from the SQL Server database:

```csharp
 public IActionResult ExportToPdf()
 {
     string connectionString = _configuration.GetConnectionString("ConnectionString");
     DataTable table = new DataTable();

     using (SqlConnection connection = new SqlConnection(connectionString))
     {
         connection.Open();
         using (SqlCommand command = new SqlCommand("PR_MST_Question_SelectAll", connection))
         {
             command.CommandType = CommandType.StoredProcedure;
             using (SqlDataReader reader = command.ExecuteReader())
             {
                 table.Load(reader);
             }
         }
     }

     MemoryStream memoryStream = new MemoryStream();
     Document document = new Document(PageSize.A4, 50, 50, 50, 50);
     PdfWriter writer = PdfWriter.GetInstance(document, memoryStream);
     document.Open();

     Font questionFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12);
     Font optionFont = FontFactory.GetFont(FontFactory.HELVETICA, 11);
     Font correctAnswerFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 11, BaseColor.Green);

     int questionNumber = 1;

     foreach (DataRow row in table.Rows)
     {
         string questionText = row["QuestionText"].ToString();
         string optionA = row["OptionA"].ToString();
         string optionB = row["OptionB"].ToString();
         string optionC = row["OptionC"].ToString();
         string optionD = row["OptionD"].ToString();
         string correctOption = row["CorrectOption"].ToString();

         // Add question number and text
         document.Add(new Paragraph($"{questionNumber}. {questionText}", questionFont));
         document.Add(new Paragraph("\n"));

         // Add options
         document.Add(new Paragraph($"A) {optionA}", correctOption == "A" ? correctAnswerFont : optionFont));
         document.Add(new Paragraph($"B) {optionB}", correctOption == "B" ? correctAnswerFont : optionFont));
         document.Add(new Paragraph($"C) {optionC}", correctOption == "C" ? correctAnswerFont : optionFont));
         document.Add(new Paragraph($"D) {optionD}", correctOption == "D" ? correctAnswerFont : optionFont));

         document.Add(new Paragraph("\n\n"));
         questionNumber++;
     }

     document.Close();

     byte[] fileBytes = memoryStream.ToArray();
     return File(fileBytes, "application/pdf", "Questions.pdf");
 }
    }
}
```
