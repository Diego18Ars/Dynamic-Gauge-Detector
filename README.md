# 🚂 Dynamic-Gauge-Detector

## 📌 Overview

**Dynamic-Gauge-Detector** is a specialized MATLAB script designed for the geometric analysis of railway vehicle spatial occupation. Right now, it calculates the envelope of a rolling stock in curves.

This tool is essential to verify **infrastructure clearance**.

---

## 🚀 Key Features

* 🛤️ **Curve envelope calculation:** Compatible with various radii to simulate real-world track conditions.
* 📊 **Visual Mapping:** Generates a 2D top-down plot showing the boundary of the vehicle relative to the track centerline.
* ⚡ **Single-File Portability:** A "singleton" script approach—no toolboxes or complex folder structures required.

---

## 🛠️ Mathematical Foundation

(Work in Progress)

---

## 📂 Installation & Usage

1.  **Download the script:**
    Clone this repository or download `dynamic-gauge-detector.m` directly.
2.  **Configuration:**
    Open the script in MATLAB and locate the following parameters:
    * `radius`: Minimum track curve radius (m)
    * `load_gauge`: Loading gauge width (m)
    * `loco_width`: Locomotive width (m)
    * `loco_length`: Locomotive length (m)
    * `bogie_dist`: Distance between bogie pivots (m)
3.  **Run:**
    Press `F5` or click **Run**. The script will output the maximum occupation width and generate a plot.

---

## 📊 Example Output

The script generates a visual representation of the vehicle's footprint:
* **Black Line:** Track Centerline.
* **Blue Box:** Static vehicle envelope.
* **Red Boundary:** The area "swept" by the loading gauge.

---

## 🤝 Contributing

Contributions are welcome! If you'd like to add features like **Transition Spirals** or **Cant/Superelevation** effects:
1. Fork the Project.
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`).
3. Commit your Changes.
4. Open a Pull Request.

---

**⚠️ Disclaimer:** *This script is for preliminary geometric study purposes only. Professional railway clearance analysis should be conducted according to regional standards (e.g., EN 15273 or AREMA).*