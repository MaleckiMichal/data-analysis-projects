# Data Processing in Excel

## 1. Data Cleaning

- Removed unnecessary columns that were not required for analysis.
- Applied transformations to all records in specific columns:
  - Replaced underscores (`_`) with spaces (` `) using the Find and Replace function (`CTRL + H`).
  - Converted text to uppercase using the formula:
    ```excel
    =UPPER(C2)
    ```
  - Capitalized the first letter of each word for a column where each cell contained a single word:
    ```excel
    =PROPER(D2)
    ```

## 2. Data Extraction

- The date format `2025-01-15T15:10:39-05:00` needed to be transformed into `15.01.2025 21:10:39`.
- This was achieved by combining multiple formulas:
  ```excel
  =VALUE(LEFT(SUBSTITUTE(G2,"T"," "),19))+TIME(6,0,0)
  ```

## 3. Calculations Performed in the Spreadsheet (Not Used for Visualization)

- Counted the number of males and females:
  - Extracted first names from a column containing full names by manually entering the first name in a new column for the first record and then using Flash Fill (`CTRL + E`) to complete the rest.
  - Counted names ending with 'a' (typically indicating female names) using:
    ```excel
    =COUNTIFS(O2:O150,"*a")
    ```
  - Calculated the percentage of males and females in the dataset.

## 4. Saving Data for Visualization

- Saved the spreadsheet as a `.csv` file and imported it into a visualization tool for further analysis.

