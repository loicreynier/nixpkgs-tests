from fpdf import FPDF
from pdfrw import PdfReader
from pdfrw import PdfWriter

FILEPATH = "./sample.pdf"

pdf = FPDF("P", "mm", "A4")
pdf.add_page()
pdf.set_margins(0, 0, 0)
pdf.set_font("Arial", "B", 14)
pdf.cell(
    10,
    10,
    "Hello World!",
)
pdf.output(FILEPATH, "F")

file = PdfReader(FILEPATH)
writer = PdfWriter()

print(file.keys())
writer.addpages([file.pages[0], file.pages[0]])
writer.write(FILEPATH)
