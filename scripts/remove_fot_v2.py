import re
import sys
import fitz  # PyMuPDF

def remove_footer_from_pdf(input_pdf, output_pdf, footer_height=50):
    # Öppna PDF-filen
    doc = fitz.open(input_pdf)

    for page_num in range(len(doc)):
        page = doc.load_page(page_num)

        # Hämta sidans rektangel
        rect = page.rect

        # Justera crop-box för att ta bort fotern
        page.set_cropbox(fitz.Rect(rect.x0, rect.y0, rect.x1, rect.y1 - footer_height))

    # Spara den redigerade PDF-filen
    doc.save(output_pdf)

def count_word_occurrences_in_pdf(pdf_path, word):
    # Extrahera text från PDF:n
    doc = fitz.open(pdf_path)
    text = ""
    for page_num in range(len(doc)):
        page = doc.load_page(page_num)
        text += page.get_text()

    # Använd regex för att hitta alla förekomster av ordet (case-insensitive)
    pattern = r'\b' + re.escape(word) + r'\b'
    matches = re.findall(pattern, text, re.IGNORECASE)

    return len(matches)

# Ta bort footer och spara den nya PDF:n
input_pdf = sys.argv[1]
output_pdf = sys.argv[2]
remove_footer_from_pdf(input_pdf, output_pdf)

# Sök efter ett ord i den redigerade PDF:n
search_word = sys.argv[3]  # Ändra till ordet du vill söka efter
occurrences = count_word_occurrences_in_pdf(output_pdf, search_word)

print(f"Antal träffar för '{search_word}': {occurrences}")
