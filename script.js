document.addEventListener('DOMContentLoaded', function() {
    try {
        // Determine the base URL based on current environment
        const currentHost = window.location.host;
        const currentProtocol = window.location.protocol;
        const currentPath = window.location.pathname;
        let menuUrl;
        
        // Use appropriate URL based on environment
        if (currentHost.includes('github.io')) {
            // GitHub Pages environment (including staging)
            if (currentPath.includes('/lacostacocina')) {
                // Staging or repository path
                const basePath = currentPath.includes('/lacostacocina') ? '/lacostacocina' : '';
                menuUrl = `${currentProtocol}//${currentHost}${basePath}/menu.html`;
            } else {
                menuUrl = `${currentProtocol}//${currentHost}/menu.html`;
            }
        } else if (currentHost.includes('lacostacocina.com')) {
            // Custom domain environment
            menuUrl = `${currentProtocol}//${currentHost}/menu.html`;
        } else {
            // Local development or other environment
            menuUrl = 'menu.html';
        }
        
        // Update menu link button href
        const menuLinkButton = document.getElementById('menuLinkButton');
        if (menuLinkButton) {
            menuLinkButton.href = menuUrl;
            
            // Add click tracking for analytics
            menuLinkButton.addEventListener('click', function() {
                console.log('Menu Link clicked - redirecting to:', menuUrl);
            });
        }
        
        // Get the QR code container
        const qrcodeContainer = document.getElementById("qrcode");
        
        // Clear any existing content
        qrcodeContainer.innerHTML = '';
        
        // Generate QR code with the dynamic URL
        new QRCode(qrcodeContainer, {
            text: menuUrl,
            width: 256,
            height: 256,
            colorDark: "#000000",
            colorLight: "#ffffff",
            correctLevel: QRCode.CorrectLevel.H
        });

        // Log success message
        console.log('QR Code generated successfully for URL:', menuUrl);
        console.log('Menu Link feature initialized');
        console.log('Current environment detected - Host:', currentHost, 'Path:', currentPath);
    } catch (error) {
        console.error('Error generating QR code:', error);
        document.getElementById("qrcode").innerHTML = 'Error generating QR code. Please refresh the page.';
    }
});