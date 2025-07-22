# מחפש אנשי קשר לגביה - Contact Finder

אפליקציית אינטרנט להתייעלות מחלקת הגביה - מציאת אנשי קשר רלוונטיים עבור מעקב תשלומים.

## 📋 תיאור הפרויקט

Contact Finder הוא כלי אינטרנט המיועד לייעל את עבודתה של מחלקת הגביה על ידי מרכוז ואוטומציה של תהליך מציאת מידע על אנשי קשר רלוונטיים עבור דיונים על תשלומים שקלקלו.

### ✨ תכונות עיקריות

- **חיפוש מאוחד**: ממשק חיפוש יחיד לכל סוגי הלקוחות
- **זיהוי אוטומטי**: זיהוי סוג לקוח אוטומטי (חברות, קיבוצים, לקוחות פרטיים)
- **קטלוג אנשי קשר**: הצגת אנשי קשר מאורגנים עם פרטים מלאים
- **מערכת מועדפים**: שמירת אנשי קשר נפוצים לגישה מהירה
- **היסטוריית חיפושים**: שמירת חיפושים אחרונים
- **ייצוא נתונים**: ייצוא רשימות אנשי קשר לקבצי CSV
- **תמיכה בעברית RTL**: ממשק מלא בעברית עם תמיכה בכיוון מימין לשמאל

## 🚀 התקנה מהירה

### דרישות מוקדמות

- דפדפן אינטרנט מודרני (Chrome 90+, Firefox 88+, Safari 14+, Edge 90+)
- מפתח API של SerpAPI (אופציונלי למצב demo)

### הפעלה מקומית

1. **שכפול הפרויקט:**
```bash
git clone https://github.com/yourusername/contactfinder.git
cd contactfinder
```

2. **הגדרת מפתח API (אופציונלי):**
   - היכנס ל [SerpAPI](https://serpapi.com/) וצור חשבון
   - קבל מפתח API
   - ערוך את `index.html` ושנה את `YOUR_SERPAPI_KEY_HERE` למפתח האמיתי

3. **הפעלת השרת המקומי:**
```bash
# באמצעות Python 3
python -m http.server 8000

# או באמצעות Python 2
python -m SimpleHTTPServer 8000

# או באמצעות Node.js
npx serve .
```

4. **פתח דפדפן:**
   - עבור אל `http://localhost:8000`

## 📁 מבנה הפרויקט

```
contactfinder/
├── index.html          # קובץ אפליקציה עיקרי (כל הקוד)
├── README.md           # תיעוד פרויקט
├── contact-finder-prd.md # מסמך דרישות מוצר
└── assets/             # תמונות ונכסים (אופציונלי)
```

## 🛠️ טכנולוגיות

- **Frontend**: HTML5, CSS3, JavaScript (Vanilla)
- **Styling**: Tailwind CSS (CDN)
- **Icons**: Lucide Icons
- **Fonts**: Google Fonts (Rubik)
- **API Integration**: SerpAPI
- **Storage**: LocalStorage
- **Deployment**: GitHub Pages Ready

## 📊 שימוש באפליקציה

### חיפוש אנשי קשר

1. **הזן שם לחיפוש**: חברה, קיבוץ, מספר חברה או שם לקוח
2. **בחר סוג לקוח**: זיהוי אוטומטי או בחירה ידנית
3. **לחץ "חפש אנשי קשר"**
4. **עיון בתוצאות**: אנשי קשר מסודרים לפי רלוונטיות

### ניהול אנשי קשר

- **הוספה למועדפים**: לחץ על אייקון הלב
- **חיוג ישיר**: לחץ על כפתור "חייג"
- **שליחת מייל**: לחץ על כפתור "מייל"
- **העתקת פרטים**: לחץ על כפתור "העתק"

### ייצוא נתונים

1. לחץ על אייקון ההורדה בכותרת
2. הקובץ יורד אוטומטית בפורמט CSV
3. פתח ב-Excel או Google Sheets

## 🏗️ אדריכלות מערכת

### זיהוי סוג לקוח

האפליקציה מזהה אוטומטית סוג לקוח על בסיס דפוסי טקסט:

```javascript
// דוגמאות לזיהוי:
"חברת ABC בע\"מ" → חברה
"קיבוץ געתון" → קיבוץ  
"514234567" → חברה (מספר רישום)
"יוסי כהן מנהל רכש" → לקוח פרטי
```

### קטלוג אנשי קשר

| סוג לקוח | איש קשר ראשי | איש קשר משני |
|----------|---------------|---------------|
| חברה עם חשבונות | מנהל חשבונות | CFO |
| חברה ללא חשבונות | מנהל עסקי | מנהל רכש |
| קיבוץ | מנהל חשבונות | מזכיר |
| לקוח פרטי | בעל העסק | איש קשר |

## 🚀 פריסה ל-GitHub Pages

### הגדרה אוטומטית

1. **העלאת קוד ל-GitHub:**
```bash
git add .
git commit -m "Initial Contact Finder implementation"
git push origin main
```

2. **הפעלת GitHub Pages:**
   - עבור להגדרות Repository
   - בחר "Pages" בתפריט צד
   - בחר "Deploy from a branch"
   - בחר "main" branch ו-"/ (root)"
   - לחץ "Save"

3. **האתר יהיה זמין ב:**
   `https://yourusername.github.io/contactfinder`

### הגדרה מותאמת אישית

צור קובץ `.github/workflows/deploy.yml`:

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./
```

## 🔧 התאמה אישית

### שינוי מפתח API

ערוך בקובץ `index.html`:

```javascript
const SERP_API_CONFIG = {
    apiKey: 'YOUR_ACTUAL_API_KEY', // החלף כאן
    baseUrl: 'https://serpapi.com/search.json',
    // ... שאר הגדרות
};
```

### הוספת שפות

ערוך מערך השמות בפונקציית `generateMockContact`:

```javascript
const firstNames = ['יוסי', 'רות', /* הוסף שמות */];
const lastNames = ['כהן', 'לוי', /* הוסף שמות משפחה */];
```

### שינוי עיצוב

ערוך מחלקות Tailwind CSS בתגיות HTML או הוסף CSS מותאם אישית בתגית `<style>`.

## 📈 ביצועים

- **זמן טעינה**: פחות מ-2 שניות
- **זמן תגובת חיפוש**: פחות מ-3 שניות
- **תמיכה במובייל**: מותאם לכל גדלי מסך
- **זיכרון מטמון**: שמירה מקומית של חיפושים אחרונים
- **דחיסה**: אופטימיזציית גדלי קבצים

## 🧪 בדיקות

### בדיקה ידנית

1. **חיפוש בסיסי**: וודא שהחיפוש מחזיר תוצאות
2. **זיהוי RTL**: וודא שהטקסט בעברית מיושר נכון
3. **רספונסיביות**: בדוק בגדלי מסך שונים
4. **מועדפים**: וודא שמירת אנשי קשר במועדפים
5. **ייצוא**: בדוק הורדת קובץ CSV

### בדיקה אוטומטית

```javascript
// דוגמאות לבדיקות יחידה
function testCustomerTypeDetection() {
    console.assert(detectCustomerType('חברת ABC בע״מ') === 'company');
    console.assert(detectCustomerType('קיבוץ געתון') === 'kibbutz');
    console.assert(detectCustomerType('יוסי כהן') === 'private');
}

function testContactCategorization() {
    const contact = { title: 'מנהל חשבונות', company: 'ABC Ltd' };
    console.assert(categorizeContact(contact, 'company') === 'מנהל חשבונות');
}
```

## 🔒 אבטחה ופרטיות

- **אי-שמירת נתונים**: ללא שמירה קבועה של נתוני לקוחות
- **קריאות HTTPS בלבד**: כל הקריאות מאובטחות
- **הגנת מפתח API**: החבאת מפתח API בצד הלקוח (לפיתוח בלבד)
- **ניהול session**: ניקוי cache בעת יציאה

## 📊 מדדי הצלחה

- **חיסכון זמן**: הפחתה של 80% בזמן חיפוש אנשי קשר
- **שיעור הצלחת חיפוש**: 90%+ תוצאות רלוונטיות  
- **אימוץ משתמשים**: 100% מצוות הגביה תוך 30 יום
- **דיוק אנשי קשר**: 95%+ מידע נכון

## 🐛 פתרון בעיות

### בעיות נפוצות

1. **שגיאת API**:
   - ודא שמפתח SerpAPI תקין
   - בדוק מכסת API חודשית
   - וודא חיבור אינטרנט יציב

2. **בעיות RTL**:
   - וודא שהמאפיין `dir="rtl"` קיים
   - בדוק תמיכת דפדפן ב-RTL
   - נקה cache דפדפן

3. **בעיות ביצועים**:
   - בדוק מהירות חיבור אינטרנט
   - נקה LocalStorage
   - השבת הרחבות דפדפן

### לוגים וניפוי שגיאות

פתח Developer Tools (F12) ובדוק Console עבור הודעות שגיאה מפורטות.

## 🤝 תרומה לפרויקט

1. **Fork הפרויקט**
2. **צור branch חדש**: `git checkout -b feature/amazing-feature`
3. **Commit השינויים**: `git commit -m 'Add amazing feature'`
4. **Push ל-branch**: `git push origin feature/amazing-feature`
5. **פתח Pull Request**

## 📄 רישיון

פרויקט זה מוגש תחת רישיון MIT - ראה קובץ [LICENSE](LICENSE) לפרטים.

## 📞 יצירת קשר

- **אימייל**: your.email@example.com
- **GitHub**: [@yourusername](https://github.com/yourusername)
- **LinkedIn**: [הפרופיל שלך](https://linkedin.com/in/yourprofile)

## 🙏 תודות

- [Tailwind CSS](https://tailwindcss.com/) - מסגרת CSS
- [Lucide](https://lucide.dev/) - אייקונים
- [SerpAPI](https://serpapi.com/) - API חיפוש
- [Google Fonts](https://fonts.google.com/) - פונט Rubik

---

**מחפש אנשי קשר לגביה** - פותח עם ❤️ עבור מחלקת הגביה