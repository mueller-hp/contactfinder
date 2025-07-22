// Contact Finder Configuration
// This file handles environment variable loading for different environments

class Config {
    constructor() {
        this.config = {
            // Default configuration
            serpApiKey: '',
            serpApiBaseUrl: 'https://serpapi.com/search.json',
            serpApiRateLimit: 100,
            cacheExpiry: 3600000, // 1 hour
            appEnv: 'production',
            debugMode: false
        };
        
        this.loadConfig();
    }
    
    loadConfig() {
        // For GitHub Pages deployment, we'll need to set the API key directly
        // In a real production environment, you would load from server-side environment variables
        
        // Check if we're in development mode (local file:// protocol)
        const isDevelopment = window.location.protocol === 'file:' || 
                             window.location.hostname === 'localhost' || 
                             window.location.hostname === '127.0.0.1';
        
        if (isDevelopment) {
            // Development configuration
            this.config.serpApiKey = '75bb618780fd664a4dce1e395d15a4e09f5dd2aa93710388409b3ffcaafc628a';
            this.config.debugMode = true;
            this.config.appEnv = 'development';
        } else {
            // Production configuration
            // For GitHub Pages, we need to set the API key directly
            // In a real production environment, you would use a serverless function
            this.config.serpApiKey = '75bb618780fd664a4dce1e395d15a4e09f5dd2aa93710388409b3ffcaafc628a';
            this.config.debugMode = false;
            this.config.appEnv = 'production';
        }
    }
    
    get(key) {
        return this.config[key];
    }
    
    getAll() {
        return { ...this.config };
    }
    
    isDevelopment() {
        return this.config.appEnv === 'development';
    }
    
    isProduction() {
        return this.config.appEnv === 'production';
    }
    
    // Security method to obfuscate API key in logs
    getSafeApiKey() {
        const key = this.config.serpApiKey;
        if (!key) return 'NOT_SET';
        return key.substring(0, 8) + '...' + key.substring(key.length - 8);
    }
}

// Global configuration instance
window.ContactFinderConfig = new Config();

// Log configuration (safe version)
if (window.ContactFinderConfig.get('debugMode')) {
    console.log('Contact Finder Configuration Loaded:', {
        environment: window.ContactFinderConfig.get('appEnv'),
        apiKey: window.ContactFinderConfig.getSafeApiKey(),
        baseUrl: window.ContactFinderConfig.get('serpApiBaseUrl'),
        rateLimit: window.ContactFinderConfig.get('serpApiRateLimit')
    });
}