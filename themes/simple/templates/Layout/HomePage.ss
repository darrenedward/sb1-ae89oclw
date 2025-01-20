<div class="landing-page">
    <div class="hero-section">
        <div class="container">
            <div class="hero-content text-center">
                <h1>Find Your Local Restaurant</h1>
                <div class="location-search mt-4">
                    <div class="row justify-content-center">
                        <div class="col-md-6">
                            <form id="locationSearchForm" class="location-form">
                                <div class="input-group">
                                    <input type="text" 
                                           id="locationInput" 
                                           class="form-control form-control-lg" 
                                           placeholder="Enter your location..."
                                           aria-label="Search location">
                                    <button class="btn btn-primary btn-lg" type="submit">
                                        <i class="fas fa-search"></i> Find Stores
                                    </button>
                                </div>
                                <div class="form-check mt-2">
                                    <input class="form-check-input" type="checkbox" id="useCurrentLocation">
                                    <label class="form-check-label text-white" for="useCurrentLocation">
                                        Use my current location
                                    </label>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container my-5">
        <div id="nearbyStores" class="stores-grid">
            <div class="row" id="storesContainer">
                <% loop $NearbyStores %>
                    <div class="col-md-4 mb-4">
                        <div class="store-card">
                            <div class="store-image">
                                <% if $FeaturedImage %>
                                    $FeaturedImage.Fill(350,200)
                                <% else %>
                                    <img src="$ThemeDir/templates/images/store-placeholder.jpg" alt="$Title" class="img-fluid">
                                <% end_if %>
                                <% if $IsOpen %>
                                    <span class="status-badge open">Open</span>
                                <% else %>
                                    <span class="status-badge closed">Closed</span>
                                <% end_if %>
                            </div>
                            <div class="store-info">
                                <h3>$Title</h3>
                                <p class="address">
                                    <i class="fas fa-map-marker-alt"></i> $Address
                                </p>
                                <p class="distance" data-lat="$Latitude" data-lng="$Longitude">
                                    <i class="fas fa-route"></i> Calculating...
                                </p>
                                <div class="store-meta">
                                    <div class="rating">
                                        <i class="fas fa-star"></i> $Rating
                                    </div>
                                    <div class="cuisine-type">$CuisineType</div>
                                </div>
                                <div class="store-actions">
                                    <a href="$Link" class="btn btn-primary">View Menu</a>
                                    <button class="btn btn-outline-primary favorite-btn" 
                                            data-store-id="$ID"
                                            data-is-favorite="$IsFavorite">
                                        <i class="fas fa-heart"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                <% end_loop %>
            </div>
        </div>
    </div>
</div>