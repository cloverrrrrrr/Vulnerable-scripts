Vulnerable Bash Script – Security Demonstration
===============================================

📌 Overview
-----------

This repository contains a **simple Bash script** that is **intentionally vulnerable** and designed for **educational purposes only**.The goal of this project is to demonstrate **common security vulnerabilities** and explain **why they are dangerous and how they can be fixed**.

⚠️ **DISCLAIMER:**This code is **NOT secure** and **MUST NOT** be used in production environments.

📂 Repository Structure
-----------------------

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   .  ├── vuln_tool.sh  └── README.md   `

📄 Script Description
---------------------

The script (vuln\_tool.sh) simulates a **basic admin utility tool** that:

*   Authenticates an admin user
    
*   Displays file information
    
*   Lists directory contents
    
*   Fetches user data from an external API
    

The script was intentionally written with **poor security practices** to demonstrate real-world vulnerabilities.

🔓 Identified Security Vulnerabilities
--------------------------------------

This script contains **four (4) security vulnerabilities**:

1.  Hardcoded Credentials
    
2.  Missing Input Validation
    
3.  Command Injection
    
4.  Insecure API Call
    

Each vulnerability is explained below.

1️⃣ Hardcoded Credentials
-------------------------

### Vulnerable Code

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   API_KEY="sk_test_1234567890"  ADMIN_USER="admin"  ADMIN_PASS="admin123"   `

### Explanation

Sensitive information such as:

*   Admin username
    
*   Admin password
    
*   API key
    

is stored **directly inside the source code**.

### Why This Is a Risk

*   Anyone with access to the script can see the credentials.
    
*   If the repository is leaked or made public, attackers gain full access.
    

### Potential Impact

*   Unauthorized admin access
    
*   API abuse
    
*   Privilege escalation
    

### Recommended Fix

*   Store secrets in **environment variables**
    
*   Use secret managers or .env files
    
*   Never commit secrets to source control
    

2️⃣ Missing Input Validation
----------------------------

### Vulnerable Code

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   read -p "Enter filename to check size: " filename  ls -lh $filename   `

### Explanation

User input is used directly without checking:

*   Whether the file exists
    
*   Whether the input contains dangerous characters
    
*   Whether path traversal is attempted
    

### Why This Is a Risk

Attackers can provide malicious input such as:

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   ../../etc/passwd   `

### Potential Impact

*   Unauthorized file access
    
*   Information disclosure
    

### Recommended Fix

*   Validate input using allowlists (regex)
    
*   Check file existence before use
    
*   Reject dangerous characters
    

3️⃣ Command Injection
---------------------

### Vulnerable Code

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   read -p "Enter directory to list: " dir  cmd="ls $dir"  eval $cmd   `

### Explanation

User input is executed directly as part of a shell command using eval.

### Why This Is a Risk

Attackers can inject additional commands:

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   ; whoami  ; rm -rf /   `

### Potential Impact

*   Arbitrary command execution
    
*   Full system compromise
    
*   Data loss
    

### Recommended Fix

*   Avoid eval
    
*   Use safe command execution
    
*   Quote variables properly
    
*   Validate input strictly
    

4️⃣ Insecure API Call
---------------------

### Vulnerable Code

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   curl "http://api.example.com/user?id=$user_id&apikey=$API_KEY"   `

### Explanation

The API request:

*   Uses **HTTP instead of HTTPS**
    
*   Exposes API key in the URL
    
*   Does not validate user input
    

### Why This Is a Risk

*   Traffic can be intercepted (Man-in-the-Middle attack)
    
*   API key can be stolen
    
*   Attackers can manipulate API parameters
    

### Potential Impact

*   Data leakage
    
*   API abuse
    
*   Account compromise
    

### Recommended Fix

*   Use HTTPS
    
*   Send API keys via headers
    
*   Validate all parameters
