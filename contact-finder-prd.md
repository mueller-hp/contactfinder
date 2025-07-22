# Product Requirements Document (PRD)
## Contact Finder - Collections Department Efficiency Tool

### 1. Executive Summary

The Contact Finder application is a web-based tool designed to streamline the collections department's workflow by centralizing and automating the process of finding relevant contact information for overdue payment discussions. The application addresses the significant time resource challenge of manually searching for appropriate contacts across various customer types.

### 2. Problem Statement

Collections department managers spend excessive time searching for relevant contact information when following up on overdue invoices. The current process involves:
- Manual searching across multiple sources
- Difficulty identifying the correct department/person to contact
- Inconsistent contact information across different customer types
- Lost productivity due to repetitive manual searches

### 3. Solution Overview

A single-page web application that:
- Provides a unified search interface for finding relevant contacts
- Automatically aggregates contact information from multiple sources via SerpAPI
- Categorizes contacts based on customer type (private clients, companies, kibbutzim)
- Presents organized, actionable contact information instantly

### 4. User Personas

**Primary User: Collections Department Manager**
- Manages overdue accounts and payment follow-ups
- Needs quick access to relevant contact information
- Works with various customer types (private clients, companies, kibbutzim)
- Values time efficiency and accuracy

**Secondary Users: Collections Team Members**
- Support the collections process
- Need access to contact information for follow-up calls
- Require simple, intuitive interface

### 5. Functional Requirements

#### 5.1 Search Functionality
- **Single Search Field**: Accept multiple input types:
  - Customer name
  - Company name
  - Company number
  - Kibbutz name
  - Any other relevant identifier
- **Auto-complete**: Suggest matches as user types
- **Search History**: Recent searches for quick access

#### 5.2 Data Aggregation
- **SerpAPI Integration**: 
  - Backend integration (invisible to users)
  - Aggregate results from multiple sources
  - Real-time data fetching
- **Smart Filtering**: Remove irrelevant results
- **Data Enrichment**: Combine information from multiple sources

#### 5.3 Contact Categorization
- **Customer Type Detection**:
  - Companies with accounting departments → Accounting Manager
  - Kibbutzim → Accounting Manager or Secretary
  - Private clients → Business Manager or Purchasing Agent
- **Role Prioritization**: Display most relevant contacts first

#### 5.4 Results Display
- **Contact Cards**: Display for each result:
  - Name and title
  - Phone number(s)
  - Email address
  - Department/Role
  - Company/Organization name
  - Relevance indicator
- **Quick Actions**:
  - Click-to-call functionality
  - Copy contact information
  - Add notes/tags
  - Mark as contacted

#### 5.5 Data Management
- **Favorites**: Save frequently contacted persons
- **Notes**: Add collection-specific notes to contacts
- **Export**: Download contact lists as CSV/Excel

### 6. Technical Requirements

#### 6.1 Architecture
- **Single HTML File**: All functionality in one file
- **Client-side Processing**: Minimize server dependencies
- **Responsive Design**: Mobile and desktop compatible

#### 6.2 Hebrew Interface Requirements
- **RTL Layout**: Full right-to-left support
- **Hebrew Labels**: All UI elements in Hebrew
- **Hebrew Date Format**: DD/MM/YYYY
- **Hebrew Number Format**: Appropriate separators

#### 6.3 Integration
- **SerpAPI**:
  - API key management
  - Rate limiting handling
  - Error handling for failed requests
  - Caching for repeated searches

#### 6.4 Performance
- **Load Time**: < 2 seconds
- **Search Response**: < 3 seconds
- **Offline Capability**: Cache recent searches

#### 6.5 Deployment
- **GitHub Pages**: Static hosting
- **No Server Requirements**: Pure client-side application
- **CDN Integration**: For assets and libraries

### 7. User Interface Design

#### 7.1 Layout Components
- **Header**: Application title and user controls
- **Search Bar**: Prominent, centered search field
- **Results Area**: Card-based layout for contacts
- **Sidebar**: Filters and recent searches
- **Footer**: Quick links and statistics

#### 7.2 Visual Design
- **Clean Interface**: Minimal, professional appearance
- **Clear Typography**: Easy-to-read Hebrew fonts
- **Color Coding**: Different colors for contact types
- **Icons**: Intuitive icons for actions

#### 7.3 Responsive Behavior
- **Desktop**: Full feature set with sidebar
- **Tablet**: Collapsible sidebar
- **Mobile**: Stacked layout, touch-optimized

### 8. User Flow

1. **Search Initiation**:
   - User enters search term
   - Auto-suggestions appear
   - User selects or completes search

2. **Results Processing**:
   - Loading indicator shows
   - Results populate progressively
   - Relevant contacts appear first

3. **Contact Selection**:
   - User reviews contact cards
   - Clicks preferred contact method
   - System logs interaction

4. **Follow-up Actions**:
   - Add notes post-call
   - Mark contact status
   - Schedule follow-up

### 9. Security & Privacy

- **No Data Storage**: No customer data stored permanently
- **Secure API Calls**: HTTPS only
- **API Key Protection**: Client-side obfuscation
- **Session Management**: Clear cache on logout

### 10. Success Metrics

- **Time Saved**: Reduce contact search time by 80%
- **Search Success Rate**: 90%+ relevant results
- **User Adoption**: 100% of collections team within 30 days
- **Contact Accuracy**: 95%+ correct contact information

### 11. Implementation Phases

#### Phase 1: MVP (Weeks 1-4)
- Basic search functionality
- SerpAPI integration
- Hebrew UI implementation
- Core contact display

#### Phase 2: Enhancement (Weeks 5-8)
- Favorites and history
- Advanced filtering
- Export functionality
- Performance optimization

#### Phase 3: Polish (Weeks 9-10)
- UI/UX refinements
- Additional data sources
- Analytics integration
- User training materials

### 12. Risks & Mitigation

| Risk | Impact | Mitigation |
|------|--------|------------|
| SerpAPI rate limits | Search delays | Implement caching and request queuing |
| Inaccurate search results | User frustration | Add manual entry option and feedback system |
| API key exposure | Security breach | Implement proxy service for production |
| Browser compatibility | Limited access | Test across major browsers, provide fallbacks |

### 13. Future Enhancements

- **CRM Integration**: Connect with existing systems
- **AI-Powered Suggestions**: Learn from usage patterns
- **Multi-language Support**: Expand beyond Hebrew
- **Team Collaboration**: Share notes and insights
- **Automated Follow-ups**: Schedule and track communications

### 14. Technical Specifications

#### 14.1 Technology Stack
- **Frontend**: HTML5, CSS3, Vanilla JavaScript
- **Styling**: Tailwind CSS or custom CSS
- **API Integration**: Fetch API for SerpAPI calls
- **Storage**: LocalStorage for caching
- **Build Tools**: None (single file)

#### 14.2 Browser Support
- Chrome 90+
- Firefox 88+
- Safari 14+
- Edge 90+
- Mobile browsers (iOS Safari, Chrome Android)

#### 14.3 Dependencies
- Minimal external dependencies
- All libraries included inline
- No build process required

### 15. Acceptance Criteria

- [ ] Single search field accepts all input types
- [ ] Results appear within 3 seconds
- [ ] Hebrew RTL layout works correctly
- [ ] Contact information is accurate and actionable
- [ ] Application loads from single HTML file
- [ ] Works on GitHub Pages without server
- [ ] Mobile responsive design functions properly
- [ ] API integration is transparent to users

### 16. Appendices

#### A. Sample Search Queries
- "חברת ABC"
- "קיבוץ געתון"
- "514234567" (company number)
- "יוסי כהן מנהל רכש"

#### B. Contact Type Matrix
| Customer Type | Primary Contact | Secondary Contact |
|--------------|-----------------|-------------------|
| Company with Accounting | Accounting Manager | CFO |
| Company without Accounting | Business Manager | Purchasing Manager |
| Kibbutz | Accounting Manager | Secretary |
| Private Client | Owner | Purchasing Agent |

#### C. API Response Handling
```javascript
// Example API response processing
{
  "results": [
    {
      "name": "שם איש קשר",
      "title": "מנהל חשבונות",
      "phone": "050-1234567",
      "email": "contact@company.co.il",
      "company": "חברה בע״מ",
      "relevance": 0.95
    }
  ]
}
```