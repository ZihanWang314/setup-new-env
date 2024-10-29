import argparse
import os
import json

def generate_report(directory, output_file, preferences_file):
    user_preferences = {}
    if os.path.exists(preferences_file):
        with open(preferences_file, 'r') as pref_file:
            user_preferences = json.load(pref_file)

    try:
        with open(output_file, 'w') as output:
            file_counter = 1
            for root, _, files in os.walk(directory):
                if "annotations" in root or "videos" in root or ".git" in root:
                    continue
                for file in files:
                    file_path = os.path.join(root, file)
                    if file_path in user_preferences:
                        use_file = user_preferences[file_path]
                    else:
                        use_file = input(f"Do you want to use the file '{file_path}'? (y/N): ").strip().lower()
                        while use_file not in ['y', 'n']:
                            use_file = input(f"Do you want to use the file '{file_path}'? (y/N): ").strip().lower()
                        user_preferences[file_path] = use_file
                    if use_file == 'n':
                        continue
                    try:
                        with open(file_path, 'r', encoding='utf-8') as file_content:
                            content = file_content.read()
                    except Exception as e:
                        content = f"Could not read file due to error: {e}"
                    
                    output.write(f"FILE {file_counter}: {file_path}\n")
                    content = '"""\n' + content + '\n' + '"""' + '\n'
                    output.write(content)
                    file_counter += 1
        with open(preferences_file, 'w') as pref_file:
            json.dump(user_preferences, pref_file, indent=4)

        print(f"Report generated successfully at: {output_file}")
    except Exception as e:
        print(f"Error occurred while generating the report: {e}")

if __name__ == "__main__":
    # Specify your directory path and output TXT file name
    parser = argparse.ArgumentParser(description="Process directory path and output TXT file path.")
    
    # Add arguments for directory path and output file path
    parser.add_argument("--dir", type=str, help="The path of the directory to be processed.")
    parser.add_argument("--out", type=str, help="The path of the output TXT file.", default="report.txt", required=False)
    parser.add_argument("--pref", type=str, help="The path of the preferences JSON file.", default="pref.json", required=False)
    
    # Parse the arguments
    args = parser.parse_args()
    
    # Access the arguments
    directory_path = args.dir
    output_txt_path = args.out
    preferences_file = args.pref
    
    # Generate the report
    generate_report(directory_path, output_txt_path, preferences_file)
