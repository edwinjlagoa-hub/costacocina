document.addEventListener('DOMContentLoaded', function() {
    fetch('menu-data.json')
        .then(response => response.json())
        .then(data => {
            const menuContent = document.getElementById('menu-content');
            
            data.categories.forEach(category => {
                const section = document.createElement('div');
                section.className = 'menu-section';
                
                section.innerHTML = `
                    <h2>${category.name}</h2>
                    ${category.items.map(item => `
                        <div class="menu-item">
                            <h3>
                                ${item.name}
                                <span class="price">$${item.price.toFixed(2)}</span>
                            </h3>
                            <p>${item.description}</p>
                        </div>
                    `).join('')}
                `;
                
                menuContent.appendChild(section);
            });
        })
        .catch(error => {
            console.error('Error loading menu:', error);
            document.getElementById('menu-content').innerHTML = '<p>Error loading menu. Please try again later.</p>';
        });
});