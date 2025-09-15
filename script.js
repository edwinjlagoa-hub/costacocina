document.addEventListener('DOMContentLoaded', function() {
    try {
        // Use the GitHub Pages URL
        const menuUrl = 'https://edwinjlagoa-hub.github.io/lacostacocina/menu.html';
        
        // Get the QR code container
        const qrcodeContainer = document.getElementById("qrcode");
        
        // Clear any existing content
        qrcodeContainer.innerHTML = '';
        
        // Generate QR code
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
    } catch (error) {
        console.error('Error generating QR code:', error);
        document.getElementById("qrcode").innerHTML = 'Error generating QR code. Please refresh the page.';
    }
});