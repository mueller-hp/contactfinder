# Security Guidelines for Contact Finder

## 🔐 API Key Security

### Development Environment
- API keys are stored in `.env` file (never committed to Git)
- Configuration is loaded through `config.js`
- Debug mode shows obfuscated API keys only

### Production Environment (GitHub Pages)

**⚠️ IMPORTANT SECURITY NOTICE:**

Since GitHub Pages only supports static hosting, the API key is currently embedded in the client-side code. This is **NOT recommended for production use** with sensitive data.

### Recommended Production Setup

#### Option 1: Serverless Function (Recommended)
Create a serverless function to proxy SerpAPI calls:

```javascript
// netlify/functions/search.js or vercel/api/search.js
export default async function handler(req, res) {
  const { query, customerType } = req.body;
  
  const response = await fetch(`https://serpapi.com/search.json`, {
    method: 'GET',
    headers: {
      'Authorization': `Bearer ${process.env.SERPAPI_KEY}`
    },
    // ... rest of API call
  });
  
  res.json(await response.json());
}
```

#### Option 2: Backend Service
- Deploy a backend service (Node.js, Python, etc.)
- Keep API keys on server-side only
- Use CORS to allow requests from your domain only

#### Option 3: API Gateway
- Use AWS API Gateway, Cloudflare Workers, or similar
- Implement rate limiting and authentication
- Keep sensitive keys in environment variables

## 🛡️ Security Best Practices

### Data Protection
- ✅ No sensitive customer data stored permanently
- ✅ LocalStorage data cleared on logout
- ✅ HTTPS-only requests
- ✅ Input sanitization implemented

### API Security
- ✅ Rate limiting implemented
- ✅ Request caching to minimize API calls
- ✅ Error handling without exposing internals
- ⚠️ API key exposed in client (needs serverless proxy for production)

### Content Security Policy
Add to your HTML head for enhanced security:

```html
<meta http-equiv="Content-Security-Policy" 
      content="default-src 'self' 'unsafe-inline' 
               cdn.tailwindcss.com 
               fonts.googleapis.com 
               fonts.gstatic.com 
               unpkg.com 
               serpapi.com;
               script-src 'self' 'unsafe-inline' 
               cdn.tailwindcss.com 
               unpkg.com;">
```

## 🔒 Environment Variables

### Required Variables
- `SERPAPI_KEY` - Your SerpAPI key (keep secret!)
- `APP_ENV` - Environment (development/production)
- `DEBUG_MODE` - Enable debug logging (true/false)

### Optional Variables
- `SERPAPI_RATE_LIMIT` - API call limit per month
- `CACHE_EXPIRY` - Cache duration in milliseconds

## 📋 Security Checklist

### Before Deployment
- [ ] Move API key to server-side or serverless function
- [ ] Implement proper CORS headers
- [ ] Add rate limiting on server-side
- [ ] Enable HTTPS (automatic with GitHub Pages)
- [ ] Add Content Security Policy headers
- [ ] Review and minimize exposed data
- [ ] Test error handling scenarios

### Monitoring
- [ ] Set up error tracking (Sentry, LogRocket, etc.)
- [ ] Monitor API usage and costs
- [ ] Track unusual request patterns
- [ ] Regular security audits

## 🚨 If API Key is Compromised

1. **Immediate Actions:**
   - Log into SerpAPI dashboard
   - Regenerate API key immediately
   - Update key in environment variables
   - Deploy new version

2. **Investigation:**
   - Check API usage logs
   - Review recent deployments
   - Audit access logs

3. **Prevention:**
   - Implement serverless proxy
   - Add additional authentication
   - Monitor usage patterns

## 📞 Reporting Security Issues

If you discover a security vulnerability, please:

1. **Do NOT** create a public GitHub issue
2. Send details to: mueller.israel.ltd@gmail.com
3. Include steps to reproduce
4. Allow time for fix before disclosure

## 🔐 Additional Security Resources

- [SerpAPI Security Best Practices](https://serpapi.com/security)
- [GitHub Pages Security](https://docs.github.com/en/pages/getting-started-with-github-pages/securing-your-github-pages-site-with-https)
- [OWASP Web Application Security](https://owasp.org/www-project-web-security-testing-guide/)

---

**Remember: Security is a continuous process, not a one-time setup!**