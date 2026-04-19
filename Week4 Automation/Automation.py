# Import subprocess module to run external Python scripts
import subprocess
# List of Python scripts to be executed sequentially
scripts = [
    r"D:\Manjula\Retail_Analysis_git\Retail_Analysis_Project\Week2 Python\Load_data.py",  # Load and clean dataset
    r"D:\Manjula\Retail_Analysis_git\Retail_Analysis_Project\Week2 Python\RFM_calculation.py",  # Perform RFM analysis
    r"D:\Manjula\Retail_Analysis_git\Retail_Analysis_Project\Week2 Python\Segmentation.py",   # Customer segmentation
    r"D:\Manjula\Retail_Analysis_git\Retail_Analysis_Project\Week2 Python\Market_basket.py"  # Market basket analysis
]

for script in scripts:
    print(f"Running: {script}")
    subprocess.run(["python", script])
