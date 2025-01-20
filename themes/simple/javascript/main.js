document.addEventListener('DOMContentLoaded', function() {
    // Location search functionality
    const locationForm = document.getElementById('locationSearchForm');
    const locationInput = document.getElementById('locationInput');
    const useCurrentLocation = document.getElementById('useCurrentLocation');
    
    if (locationForm) {
        locationForm.addEventListener('submit', function(e) {
            e.preventDefault();
            searchNearbyStores(locationInput.value);
        });
    }
    
    if (useCurrentLocation) {
        useCurrentLocation.addEventListener('change', function() {
            if (this.checked) {
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(
                        position => {
                            const { latitude, longitude } = position.coords;
                            reverseGeocode(latitude, longitude);
                            searchNearbyStores(`${latitude},${longitude}`);
                        },
                        error => {
                            console.error('Error getting location:', error);
                            this.checked = false;
                            alert('Unable to get your location. Please enter it manually.');
                        }
                    );
                } else {
                    this.checked = false;
                    alert('Geolocation is not supported by your browser.');
                }
            }
        });
    }
    
    // Calculate distances for stores
    calculateStoreDistances();
    
    // Favorite store functionality
    document.querySelectorAll('.favorite-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            const storeId = this.dataset.storeId;
            const isFavorite = this.dataset.isFavorite === "1";
            
            toggleFavoriteStore(storeId, !isFavorite);
        });
    });
});

function searchNearbyStores(location) {
    // Show loading state
    const storesContainer = document.getElementById('storesContainer');
    if (storesContainer) {
        storesContainer.innerHTML = '<div class="col text-center"><div class="spinner-border" role="status"></div></div>';
    }
    
    // Make AJAX call to backend
    fetch(`/api/v1/stores/nearby?location=${encodeURIComponent(location)}`)
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                window.location.reload(); // Refresh to show new results
            } else {
                alert('Error finding nearby stores. Please try again.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Error finding nearby stores. Please try again.');
        });
}

function calculateStoreDistances() {
    if (!navigator.geolocation) return;
    
    navigator.geolocation.getCurrentPosition(position => {
        const { latitude: userLat, longitude: userLng } = position.coords;
        
        document.querySelectorAll('.distance').forEach(el => {
            const storeLat = parseFloat(el.dataset.lat);
            const storeLng = parseFloat(el.dataset.lng);
            
            const distance = calculateDistance(userLat, userLng, storeLat, storeLng);
            el.textContent = `${distance.toFixed(1)} km away`;
        });
    });
}

function calculateDistance(lat1, lon1, lat2, lon2) {
    const R = 6371; // Earth's radius in km
    const dLat = deg2rad(lat2 - lat1);
    const dLon = deg2rad(lon2 - lon1);
    const a = 
        Math.sin(dLat/2) * Math.sin(dLat/2) +
        Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * 
        Math.sin(dLon/2) * Math.sin(dLon/2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
    return R * c;
}

function deg2rad(deg) {
    return deg * (Math.PI/180);
}

function reverseGeocode(lat, lng) {
    // Use a geocoding service to get address from coordinates
    fetch(`/api/v1/geocode/reverse?lat=${lat}&lng=${lng}`)
        .then(response => response.json())
        .then(data => {
            if (data.address) {
                locationInput.value = data.address;
            }
        })
        .catch(error => console.error('Error:', error));
}

function toggleFavoriteStore(storeId, favorite) {
    fetch('/api/v1/stores/favorite', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
        },
        body: JSON.stringify({ storeId, favorite })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            const btn = document.querySelector(`.favorite-btn[data-store-id="${storeId}"]`);
            btn.dataset.isFavorite = favorite ? "1" : "0";
            btn.classList.toggle('active', favorite);
        }
    })
    .catch(error => console.error('Error:', error));
}