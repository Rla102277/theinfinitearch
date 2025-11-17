# CLAUDE.md - AI Assistant Guide for The Infinite Arch

## Project Overview

**The Infinite Arch** is a full-stack photography portfolio web application with e-commerce capabilities. It's a Single Page Application (SPA) built with React and Firebase, featuring:

- Photo galleries organized by "missions" (photo shoots/expeditions)
- AI-powered mission planning using Google Gemini
- E-commerce integration for print sales via Shopify
- Rich content editing with WYSIWYG editor (Tiptap)
- EXIF metadata display for photography enthusiasts
- Google OAuth authentication for admin access
- Dark-themed, responsive Material-UI design

**Project Status:** Active development, functional with some placeholder credentials that need configuration.

## Technology Stack

### Frontend
- **React 18.2.0** - UI library
- **React Router DOM 6.23.1** - Client-side routing
- **Material-UI 5.15.20** - Component library and design system
- **Tiptap 2.1.0** - Rich text WYSIWYG editor
- **Create React App 4.0.3** - Build tooling (Webpack-based)

### Backend & Cloud Services
- **Firebase 10.5.0** - Complete backend platform
  - Authentication (Google OAuth)
  - Firestore (NoSQL database)
  - Cloud Functions (serverless)
  - Cloud Storage (file storage)
  - Hosting (static site)
- **Firebase Admin SDK 10.3.0** - Server-side operations

### External Services
- **Google Generative AI (Gemini)** - AI mission generation
- **Shopify Buy SDK 2.22.0** - E-commerce/print sales
- **Cloudinary** - Image CDN and transformation
- **Axios 1.13.2** - HTTP client
- **EXIFR 7.1.3** - Photo metadata extraction

### Development Environment
- **Node.js 16** - Runtime
- **Nix** - Reproducible development environment (Firebase Studio/IDX)
- **ESLint** - Google style guide
- **Jest + React Testing Library** - Testing framework

## Directory Structure

```
/home/user/theinfinitearch/
├── .idx/                          # Firebase Studio/IDX configuration
│   ├── dev.nix                   # Nix environment setup
│   └── airules.md                # AI development guidelines for Nix
├── build/                         # Firebase hosting placeholder
├── frontend/                      # React application (main codebase)
│   ├── public/                   # Static assets
│   │   ├── index.html           # HTML entry point
│   │   ├── manifest.json        # PWA manifest
│   │   └── [icons/images]
│   ├── src/
│   │   ├── components/          # Reusable components
│   │   │   ├── Navbar.js        # Navigation bar (auth-aware)
│   │   │   ├── ProtectedRoute.js # Auth route guard HOC
│   │   │   ├── TiptapEditor.js  # Rich text editor component
│   │   │   └── Tiptap.css
│   │   ├── pages/               # Route-level components
│   │   │   ├── HomePage.js      # Landing page with articles
│   │   │   ├── GalleriesPage.js # Photo gallery grid
│   │   │   ├── AboutPage.js     # Static about page
│   │   │   ├── GearPage.js      # Equipment listing
│   │   │   ├── MissionDetailPage.js  # Single mission view
│   │   │   ├── MissionGenPage.js     # AI mission generator (protected)
│   │   │   ├── LoginPage.js     # Google OAuth login
│   │   │   └── Admin.js         # Admin panel (protected)
│   │   ├── App.js               # Root component with routing
│   │   ├── index.js             # React entry point
│   │   ├── firebaseConfig.js    # Firebase SDK initialization
│   │   ├── shopifyClient.js     # Shopify API client
│   │   └── [styles/utilities]
│   ├── package.json             # Frontend dependencies
│   └── README.md                # Create React App docs
└── functions/                     # Firebase Cloud Functions
    ├── index.js                  # Cloud Functions entry point (minimal setup)
    ├── package.json              # Backend dependencies
    └── .eslintrc.js              # ESLint config (Google style)

Key Config Files:
├── firebase.json                 # Firebase project config (hosting + functions)
├── .firebaserc                   # Firebase project ID mapping
└── .gitignore                    # Git ignore rules
```

## Architecture Patterns

### Overall Architecture
**Serverless SPA with Firebase Backend**
- Frontend handles most logic via direct Firebase SDK calls
- Minimal cloud functions (currently just initialization)
- Real-time data sync with Firestore listeners
- Client-side routing with React Router

### Component Architecture
```
App (Router + Auth Context)
├── Navbar (conditional rendering based on auth)
├── Public Routes
│   ├── HomePage → Article grid from Firestore
│   ├── GalleriesPage → Photo grid (showInGallery=true)
│   ├── AboutPage → Static content
│   ├── GearPage → Equipment list from Firestore
│   ├── MissionDetailPage → Single mission with photos
│   └── LoginPage → Google OAuth flow
└── Protected Routes (ProtectedRoute HOC)
    ├── Admin → CRUD for missions and gear
    └── MissionGenPage → Gemini AI integration
```

### Data Flow Pattern
1. **Authentication:** Firebase Auth → global state via `onAuthStateChanged`
2. **Data Fetching:** Direct Firestore queries in `useEffect` hooks
3. **State Management:** React local state (no Redux/Context API currently)
4. **Route Protection:** HOC pattern wrapping protected routes
5. **Real-time Updates:** Auth listeners, manual refetches for data

### Styling Strategy
- **Component-scoped CSS:** `.css` files colocated with components
- **Global theme:** `App.css` (863 lines) with dark color palette
- **Design tokens:**
  - Background: `#1a1a1a` (dark)
  - Accent: `#3498db` (blue)
  - Text: `#ffffff` (white)
- **Responsive:** CSS Grid for galleries, flexbox for layouts
- **Material-UI:** Used for buttons, cards, modals

## Data Models

### Firestore Collections

#### `missions` Collection
```javascript
{
  title: string,              // Mission title
  description: string,        // Mission description
  location: string,          // Geographic location
  status: "draft" | "published",
  photos: [                  // Array of photo objects
    {
      url: string,           // Cloudinary URL
      caption: string,       // Photo caption
      story: string,         // Rich text HTML (Tiptap output)
      shopifyId: string,     // Shopify variant ID for print sales
      showInGallery: boolean, // Display in main gallery
      exif: {                // Camera metadata (EXIFR extracted)
        Make: string,
        Model: string,
        LensModel: string,
        FocalLength: number,
        FNumber: number,
        ISO: number,
        ExposureTime: number,
        DateTimeOriginal: string
      }
    }
  ]
}
```

#### `gear` Collection
```javascript
{
  name: string,               // Equipment name
  category: "camera" | "lens" | "drone" | "accessory",
  description: string,        // Brief description
  link: string,              // Purchase/info URL
  specsHtml: string          // Rich text specs (Tiptap output)
}
```

#### `articles` Collection (referenced but not fully implemented)
```javascript
{
  title: string,
  createdAt: timestamp,
  missionImages: object      // Structure not yet defined
}
```

### Storage Patterns
- **Images:** Hosted on Cloudinary, URLs stored in Firestore
- **Rich Text:** Stored as HTML strings (Tiptap output)
- **Authentication:** Firebase Auth handles user profiles
- **No server-side storage:** All data in Firestore or external services

## Development Workflows

### Initial Setup
```bash
# Clone repository (if not already cloned)
git clone <repository-url>
cd theinfinitearch

# Install frontend dependencies
cd frontend
npm install

# Install backend dependencies
cd ../functions
npm install

# Return to root
cd ..
```

### Environment Variables Setup
Create `frontend/.env` with:
```bash
# Firebase Configuration
REACT_APP_FIREBASE_API_KEY=your_api_key
REACT_APP_FIREBASE_AUTH_DOMAIN=your_auth_domain
REACT_APP_FIREBASE_PROJECT_ID=theinfinitearch
REACT_APP_FIREBASE_STORAGE_BUCKET=your_storage_bucket
REACT_APP_FIREBASE_MESSAGING_SENDER_ID=your_sender_id
REACT_APP_FIREBASE_APP_ID=your_app_id

# Shopify Configuration
REACT_APP_SHOPIFY_STOREFRONT_TOKEN=your_storefront_token
REACT_APP_SHOPIFY_STORE_DOMAIN=your_store.myshopify.com

# Google Gemini AI
REACT_APP_GEMINI_API_KEY=your_gemini_api_key
```

**IMPORTANT:** `Admin.js` has hardcoded Cloudinary placeholders:
- Line ~100: Replace `YOUR_CLOUDINARY_UPLOAD_PRESET`
- Line ~100: Replace `YOUR_CLOUDINARY_CLOUD_NAME`

### Development Server
```bash
# Start frontend dev server (port 3000)
cd frontend
npm start

# Start Firebase emulators (optional)
firebase emulators:start

# In separate terminal: Watch function changes
cd functions
npm run serve
```

### Testing
```bash
# Run frontend tests
cd frontend
npm test

# Run tests in CI mode
npm test -- --coverage --watchAll=false

# Backend function tests
cd functions
npm test
```

### Building for Production
```bash
# Build frontend
cd frontend
npm run build
# Output: frontend/build/

# Firebase deploy (from root)
firebase deploy                    # Deploy everything
firebase deploy --only hosting    # Frontend only
firebase deploy --only functions  # Backend only
```

### Git Workflow
**Current Branch:** `claude/claude-md-mi3dtawkm7zir46f-01QVtu8Qou94jHXfk2jDoKvK`

```bash
# Check status
git status

# Stage and commit changes
git add .
git commit -m "Description of changes"

# Push to feature branch (MUST start with 'claude/' and match session ID)
git push -u origin claude/claude-md-mi3dtawkm7zir46f-01QVtu8Qou94jHXfk2jDoKvK

# Network error retry strategy: Up to 4 retries with exponential backoff
# (2s, 4s, 8s, 16s) for push/fetch/pull operations
```

## Key Conventions and Patterns

### Code Style
- **ESLint:** Google JavaScript style guide
- **Quotes:** Double quotes for strings
- **Indentation:** 2 spaces (standard JS)
- **Semicolons:** Required
- **Arrow Functions:** Preferred for callbacks
- **Naming:**
  - Components: PascalCase (`MissionDetailPage.js`)
  - Functions: camelCase (`fetchMissions`)
  - CSS files: Match component name (`MissionDetailPage.css`)

### React Patterns
1. **Functional Components:** All components use function syntax (no class components)
2. **Hooks:** `useState`, `useEffect`, `useNavigate`, `useParams`
3. **Auth Pattern:**
   ```javascript
   useEffect(() => {
     const unsubscribe = onAuthStateChanged(auth, (user) => {
       setUser(user);
     });
     return unsubscribe;
   }, []);
   ```
4. **Protected Routes:** Wrap with `<ProtectedRoute>` HOC
5. **Data Fetching:** Direct Firestore calls in `useEffect`
   ```javascript
   useEffect(() => {
     const fetchData = async () => {
       const snapshot = await getDocs(collection(db, 'missions'));
       setData(snapshot.docs.map(doc => ({id: doc.id, ...doc.data()})));
     };
     fetchData();
   }, []);
   ```

### File Organization
- **Component-scoped CSS:** Import directly in component file
- **Page components:** One route per file in `pages/`
- **Reusable components:** Shared components in `components/`
- **Services:** API clients at root level (`firebaseConfig.js`, `shopifyClient.js`)
- **No barrel exports:** Import directly from files

### Firebase Patterns
1. **Import from config:**
   ```javascript
   import { db, auth, storage } from '../firebaseConfig';
   ```
2. **Firestore queries:**
   - Use modular SDK imports (`getDoc`, `getDocs`, `addDoc`, etc.)
   - Query ordering: `query(collection(db, 'missions'), orderBy('createdAt', 'desc'))`
3. **Storage uploads:**
   - Use Cloudinary instead of Firebase Storage for images
   - Firebase Storage available but not actively used

### Error Handling
- **Try-catch blocks:** Wrap async operations
- **User feedback:** `alert()` for errors (consider replacing with Material-UI Snackbar)
- **Console logging:** Debug information to console
- **Form validation:** Basic client-side validation before submission

### Image Handling
1. **Upload:** Cloudinary via FormData POST
2. **EXIF Extraction:** Use `exifr.parse(file)` before upload
3. **Storage:** Cloudinary URLs in Firestore (not base64)
4. **Display:** Direct `<img src={url}>` tags
5. **Optimization:** Cloudinary transformations via URL parameters

## Common Tasks Guide

### Adding a New Page/Route
1. Create component in `frontend/src/pages/NewPage.js`
2. Create styles in `frontend/src/pages/NewPage.css` (if needed)
3. Add route in `frontend/src/App.js`:
   ```javascript
   import NewPage from './pages/NewPage';
   // Inside <Routes>:
   <Route path="/new-page" element={<NewPage />} />
   ```
4. Add navigation link in `Navbar.js` (if needed)
5. If protected: Wrap with `<ProtectedRoute>`

### Adding a New Firestore Collection
1. Create data in Firestore console or via Admin panel
2. Query in component:
   ```javascript
   import { collection, getDocs } from 'firebase/firestore';
   import { db } from '../firebaseConfig';

   const snapshot = await getDocs(collection(db, 'newCollection'));
   const data = snapshot.docs.map(doc => ({id: doc.id, ...doc.data()}));
   ```
3. Add CRUD operations as needed using `addDoc`, `updateDoc`, `deleteDoc`

### Adding a New Component
1. Create file: `frontend/src/components/ComponentName.js`
2. Create styles: `frontend/src/components/ComponentName.css` (if needed)
3. Export component: `export default ComponentName;`
4. Import where needed: `import ComponentName from '../components/ComponentName';`
5. Use Material-UI components when possible for consistency

### Modifying Admin Panel
**Location:** `frontend/src/pages/Admin.js` (currently 500+ lines)

**Structure:**
- Tab-based interface (missions, gear, photos)
- Inline CRUD operations
- Rich text editing via TiptapEditor
- Image upload to Cloudinary

**To add new admin features:**
1. Add new tab to Material-UI Tabs component
2. Create corresponding TabPanel content
3. Add Firestore CRUD operations
4. Update form state management

### Working with Rich Text (Tiptap)
```javascript
import TiptapEditor from '../components/TiptapEditor';

// In component:
const [content, setContent] = useState('<p>Initial HTML</p>');

<TiptapEditor value={content} onChange={setContent} />

// Save HTML to Firestore
await updateDoc(docRef, { richContent: content });
```

### Adding External API Integration
1. Install package: `npm install package-name`
2. Create client file: `frontend/src/apiClient.js`
3. Export configured client
4. Use environment variables for credentials
5. Add error handling for API failures

### Implementing New Cloud Function
1. Add function to `functions/index.js`:
   ```javascript
   exports.functionName = functions.https.onRequest(async (req, res) => {
     // Function logic
   });
   ```
2. Deploy: `firebase deploy --only functions`
3. Call from frontend using Firebase Functions SDK or fetch/axios

## Important Notes for AI Assistants

### Things to Watch Out For

1. **Placeholder Credentials:**
   - `Admin.js` contains `YOUR_CLOUDINARY_UPLOAD_PRESET` and `YOUR_CLOUDINARY_CLOUD_NAME`
   - These MUST be replaced with actual values before image upload works
   - Check for other placeholder values before assuming functionality works

2. **Environment Variables:**
   - Frontend uses `REACT_APP_*` prefix (required by Create React App)
   - Never commit `.env` files to git
   - Verify all required env vars exist before debugging Firebase/Shopify/Gemini issues

3. **Firebase Rules:**
   - Security rules not visible in this codebase
   - Admin operations may fail if Firestore rules are restrictive
   - Authentication is required for protected routes but rules may allow public reads

4. **Build Configuration:**
   - Uses OpenSSL legacy provider flag for Node.js compatibility
   - Package.json scripts are configured for this - don't remove flags
   - May indicate older dependencies that need updating

5. **State Management:**
   - No global state management (Redux/Context)
   - Each component manages its own state
   - Auth state refetched in multiple places (could be optimized with Context)
   - Prop drilling may occur in complex components

6. **Error Handling:**
   - Basic `alert()` for user feedback (not ideal UX)
   - Consider Material-UI Snackbar for better notifications
   - Console errors may provide more detail than UI shows

7. **Testing Coverage:**
   - Minimal tests (only `App.test.js` found)
   - Testing infrastructure exists but not actively used
   - Consider adding tests before major refactoring

8. **Cloud Functions:**
   - Minimal implementation (just initialization)
   - Most backend logic happens client-side
   - Security consideration: Client has direct database access

### Performance Considerations

1. **Image Loading:**
   - No lazy loading implemented
   - Gallery pages load all images at once
   - Consider implementing intersection observer for galleries

2. **Data Fetching:**
   - No caching strategy
   - Refetches data on every component mount
   - Consider implementing cache or using React Query

3. **Bundle Size:**
   - Material-UI adds significant bundle weight
   - Consider code splitting for admin routes
   - Tree shaking may not be optimal without analysis

4. **Firestore Queries:**
   - No pagination implemented
   - All documents fetched at once
   - May cause issues with large collections

### Security Considerations

1. **Client-Side API Keys:**
   - Firebase config exposed in frontend (normal for Firebase)
   - Shopify storefront token is frontend-safe
   - Gemini API key in frontend may have quota abuse risk

2. **Authentication:**
   - Google OAuth only (no email/password fallback)
   - Admin routes protected by route guard
   - Verify Firestore rules enforce server-side protection

3. **Input Validation:**
   - Minimal validation before Firestore writes
   - Rich text input not sanitized (stored as HTML)
   - Consider DOMPurify for XSS prevention

4. **CORS:**
   - Cloudinary uploads may require CORS configuration
   - Firebase handles CORS for its services
   - Check external API CORS policies

### Debugging Tips

1. **Firebase Issues:**
   - Check browser console for Firebase errors
   - Verify `firebaseConfig.js` has correct credentials
   - Test Firebase connection with `firebase emulators:start`

2. **Build Failures:**
   - Check Node.js version (requires 16)
   - Clear `node_modules` and reinstall
   - Verify OpenSSL legacy provider flag is present

3. **Routing Issues:**
   - React Router v6 uses `element` prop (not `component`)
   - 404s on refresh indicate hosting config issue (firebase.json has rewrite rule)
   - Check browser console for route matching errors

4. **Auth Problems:**
   - Check Firebase console for enabled auth providers
   - Verify authorized domains in Firebase console
   - Test with Firebase Auth emulator for local development

5. **Style Issues:**
   - CSS specificity conflicts may occur with Material-UI
   - Check for competing styles in App.css (863 lines of global styles)
   - Use browser dev tools to inspect computed styles

### Recommended Improvements

When working on this codebase, consider suggesting:

1. **Context API for Auth:** Avoid prop drilling and redundant auth checks
2. **Snackbar/Toast Notifications:** Replace `alert()` with Material-UI Snackbar
3. **Environment Variable Validation:** Check required vars on app start
4. **Error Boundaries:** Add React error boundaries for graceful failures
5. **Loading States:** Add skeleton loaders for better UX
6. **Pagination:** Implement for missions and galleries
7. **Image Optimization:** Add lazy loading and responsive images
8. **Test Coverage:** Add tests for critical paths (auth, data fetching, forms)
9. **TypeScript:** Consider migration for type safety
10. **Code Splitting:** Split admin routes into separate bundle

## Testing Strategy

### Current Test Setup
- **Framework:** Jest (via react-scripts)
- **Libraries:** @testing-library/react, @testing-library/user-event
- **Config:** `frontend/src/setupTests.js` imports @testing-library/jest-dom
- **Coverage:** Minimal (only App.test.js exists)

### Running Tests
```bash
cd frontend
npm test                    # Watch mode
npm test -- --coverage     # With coverage report
npm test -- --watchAll=false  # CI mode
```

### Writing New Tests
```javascript
import { render, screen } from '@testing-library/react';
import ComponentName from './ComponentName';

test('renders component', () => {
  render(<ComponentName />);
  const element = screen.getByText(/expected text/i);
  expect(element).toBeInTheDocument();
});
```

### Mocking Firebase
Firebase SDK requires mocking for tests:
```javascript
jest.mock('../firebaseConfig', () => ({
  auth: {},
  db: {},
  storage: {}
}));
```

## Deployment

### Firebase Hosting
```bash
# Build frontend
cd frontend
npm run build

# Deploy from root
firebase deploy --only hosting

# Preview before deploy
firebase hosting:channel:deploy preview-name
```

### Firebase Functions
```bash
# Deploy functions
firebase deploy --only functions

# Deploy specific function
firebase deploy --only functions:functionName

# View logs
firebase functions:log
```

### Environment-Specific Deploys
- **Production:** `firebase use production && firebase deploy`
- **Staging:** `firebase use staging && firebase deploy` (if configured)

### CI/CD Considerations
- Build time: ~2-3 minutes for frontend
- Environment variables must be set in CI/CD platform
- Firebase token required: `firebase login:ci`
- Suggested workflow:
  1. Run tests
  2. Build frontend
  3. Deploy to Firebase

## Useful Commands Reference

```bash
# Development
npm start                          # Start frontend dev server
firebase emulators:start          # Start Firebase emulators
firebase serve                    # Serve hosting locally

# Testing
npm test                          # Run tests in watch mode
npm test -- --coverage           # Generate coverage report

# Building
npm run build                     # Build for production
firebase deploy                   # Deploy everything
firebase deploy --only hosting   # Deploy frontend only
firebase deploy --only functions # Deploy backend only

# Firebase
firebase login                    # Authenticate Firebase CLI
firebase projects:list           # List Firebase projects
firebase use <project-id>        # Switch active project
firebase functions:log           # View function logs
firebase hosting:channel:create preview  # Create preview channel

# Debugging
npm run build && firebase serve  # Test production build locally
firebase emulators:start --inspect-functions  # Debug functions
```

## Resources

### Documentation
- **React:** https://react.dev/
- **React Router:** https://reactrouter.com/
- **Firebase:** https://firebase.google.com/docs
- **Material-UI:** https://mui.com/
- **Tiptap:** https://tiptap.dev/
- **Create React App:** https://create-react-app.dev/

### Project-Specific
- **Firebase Console:** https://console.firebase.google.com/project/theinfinitearch
- **Cloudinary Console:** https://cloudinary.com/console
- **Shopify Admin:** https://[your-store].myshopify.com/admin
- **Google AI Studio:** https://aistudio.google.com/

### Firebase Studio/IDX
- **Customization Guide:** https://developers.google.com/idx/guides/customize-idx-env
- **Nix Guidelines:** See `.idx/airules.md` in this repository

---

## Quick Start Checklist for New AI Assistants

- [ ] Verify Node.js 16+ is installed
- [ ] Check `frontend/.env` exists with all required variables
- [ ] Replace Cloudinary placeholders in `Admin.js`
- [ ] Run `npm install` in both `frontend/` and `functions/`
- [ ] Test frontend dev server: `cd frontend && npm start`
- [ ] Verify Firebase project: `firebase projects:list`
- [ ] Check current git branch matches session ID pattern
- [ ] Review recent commits: `git log --oneline -5`
- [ ] Test Firebase connection: Try loading app and check console
- [ ] Read any TODO comments in code for known issues

---

**Last Updated:** 2025-11-17
**Codebase Version:** ~1,220 lines JavaScript across 24 source files
**Status:** Active development, functional with configuration needed for full features
