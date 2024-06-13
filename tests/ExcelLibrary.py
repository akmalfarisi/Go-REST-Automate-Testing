import openpyxl

def read_excel_data(file):
    workbook = openpyxl.load_workbook(file)
    sheet = workbook.active
    data = []
    headers = [cell.value for cell in sheet[1]]
    for row in sheet.iter_rows(min_row=2, values_only=True):
        entry = dict(zip(headers, row))
        data.append(entry)
    return data