# Banking Analytics Project

ניתוח מקיף של נתונים בנקאיים — מ-SQL ועד Machine Learning.

---

##על הפרויקט

הפרויקט הזה נועד לנתח דאטהסט בנקאי מקיף שמכיל 8 טבלאות וכ-868,950 רשומות. 
המטרה הייתה להבין את התנהגות הלקוחות, לזהות סיכונים, ולבנות מודל Machine Learning שמנבא אילו לקוחות עלולים לאחר בתשלומים.

עבדנו עם 4 כלים עיקריים:
* **SQL** — שליפה, סינון וחיבור הנתונים
* **Excel** — ארגון, ניתוח ובניית תרחישים
* **Power BI** — דשבורד אינטראקטיבי
* **Python** — מודל חיזוי

---

## 5 שאלות המחקר

1. האם לקוחות עם הכנסה גבוהה לוקחים הלוואות גדולות יותר?
2. האם דירוג אשראי נמוך מוביל לריבית גבוהה?
3. האם זמן פתרון פניות משפיע על שביעות רצון?
4. מה מאפיין לקוחות שמאחרים בתשלומים?
5. למי לא לאשר הלוואה נוספת?

---

## מבנה הפרויקט

banking-analytics-project/
├── data/           # 8 קבצי CSV — הנתונים הגולמיים
├── sql_queries/    # 5 שאילתות SQL אנליטיות
├── python_code/    # מודל Machine Learning
├── docs/           # תיעוד מלא (SQL + Python)
├── excel/          # קובץ אקסל עם 12 גיליונות
├── powerbi/        # דשבורד Power BI
└── presentation/   # מצגת הפרויקט
מה גילינו?
תובנות מרכזיות:

אין קשר בין הכנסה לגודל ההלוואה — הבנק נותן הלוואות בסכומים דומים לכולם.

הריבית זהה לכל הלקוחות — אין תמחור דיפרנציאלי לפי רמת סיכון.

2,986 לקוחות (6.27%) בסיכון — מומלץ שלא לאשר להם הלוואה נוספת.

מהמודל (Machine Learning):

דיוק (Accuracy): 73.8%

שני משתנים בלבד (loan_amount ו-interest_rate) אחראים ל-82% מהחיזוי.

הערה: הנתונים בדאטהסט סינתטיים, ולכן אין בהם דפוסים התנהגותיים אמיתיים. דבר זה משפיע ישירות על ביצועי המודל.

הכלים בהם השתמשנו
SQL: שימוש ב-CTEs, Window Functions (NTILE), JOINs, CASE WHEN, GROUP BY

Excel: נוסחאות מורכבות (XLOOKUP, INDEX+MATCH, SUMIFS, SUMPRODUCT, FILTER), 4 טבלאות ציר (Pivot Tables) עם Slicers, כרטיסי KPI, וניתוח תרחישים (What-If Analysis)


Power BI: 7 עמודים (Overview, Customers, Loans, Support, Branches), מדדי DAX, אלמנטים אינטראקטיביים (Drill-through, Bookmarks, Tooltips)

Python: pandas לניתוח הנתונים, plotly לוויזואליזציה, ו-scikit-learn לאימון מודל Random Forest

**אלנה סלומון**
- GitHub: [fakemailforme14-cloud](https://github.com/fakemailforme14-cloud)
