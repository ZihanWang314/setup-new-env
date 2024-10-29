import os

def generate_report(directory, output_file):
    try:
        with open(output_file, 'w') as output:
            file_counter = 1
            for root, _, files in os.walk(directory):
                if "annotations" in root or "videos" in root or ".git" in root:
                    continue
                for file in files:
                    file_path = os.path.join(root, file)
                    try:
                        with open(file_path, 'r', encoding='utf-8') as file_content:
                            content = file_content.read()
                    except Exception as e:
                        content = f"Could not read file due to error: {e}"
                    
                    output.write(f"FILE {file_counter}: {file_path}\n")
                    content = '"""\n' + content + '\n' + '"""' + '\n'
                    output.write(content)
                    file_counter += 1
        print(f"Report generated successfully at: {output_file}")
    except Exception as e:
        print(f"Error occurred while generating the report: {e}")

if __name__ == "__main__":
    # Specify your directory path and output TXT file name
    directory_path = "data-annotation-kfs-zihan" #input("Enter the directory path: ")
    output_txt_path = "report.txt" #input("Enter the output TXT file path: ")
    
    generate_report(directory_path, output_txt_path)
