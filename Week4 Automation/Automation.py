# Import subprocess module to run external Python scripts
import subprocess
# List of Python scripts to be executed sequentially
scripts = [
    r"D:\Manjula\Retail_Analysis_git\Retail_Analysis_Project\Week2 Python\Load_data.py",
    r"D:\Manjula\Retail_Analysis_git\Retail_Analysis_Project\Week2 Python\RFM_calculation.py",
    r"D:\Manjula\Retail_Analysis_git\Retail_Analysis_Project\Week2 Python\Segmentation.py",
    r"D:\Manjula\Retail_Analysis_git\Retail_Analysis_Project\Week2 Python\Market_basket.py"
]

for script in scripts:
    print(f"Running: {script}")
    subprocess.run(["python", script])
