# Add Open Graph tags to all blog posts

$blogPosts = @(
    @{
        file = "blog-post-pwa.html"
        title = "Building Progressive Web Apps: A Complete Guide"
        description = "Learn how to create fast, reliable, and engaging Progressive Web Apps (PWAs)."
        image = "post-6.jpg"
        date = "2025-02-28"
        author = "Muthu Selvan"
        category = "Web Development"
    },
    @{
        file = "blog-post-react-native.html"
        title = "Google Ads vs Meta Ads: Which Is Right for Your Business?"
        description = "A comprehensive comparison to help you decide where to invest your advertising budget for maximum results."
        image = "post-2.jpg"
        date = "2025-03-08"
        author = "Muthu Selvan"
        category = "Google Ads"
    },
    @{
        file = "blog-post-unity.html"
        title = "Instagram Reels Strategy: How to Go Viral in 2025"
        description = "Essential tips and techniques to create Reels that get maximum reach and engagement for your brand."
        image = "post-3.jpg"
        date = "2025-03-05"
        author = "Muthu Selvan"
        category = "Instagram Management"
    },
    @{
        file = "blog-post-seo.html"
        title = "Google Ads Strategies That Actually Work in 2025"
        description = "Discover the latest Google Ads techniques and strategies to maximize your ROI and drive qualified leads."
        image = "post-4.jpg"
        date = "2025-03-03"
        author = "Muthu Selvan"
        category = "Google Ads"
    },
    @{
        file = "blog-post-scraping.html"
        title = "Complete Guide to Web Scraping with Python"
        description = "Step-by-step tutorial on web scraping using Python, BeautifulSoup, and Selenium."
        image = "post-5.jpg"
        date = "2025-03-01"
        author = "Muthu Selvan"
        category = "Tutorials"
    }
)

foreach ($post in $blogPosts) {
    $filePath = "msora-website/$($post.file)"
    
    if (Test-Path $filePath) {
        $content = Get-Content $filePath -Raw
        
        # Check if OG tags already exist
        if ($content -notmatch 'og:title') {
            Write-Host "Adding OG tags to $($post.file)..."
            
            $ogTags = @"
    
    <!-- Open Graph Meta Tags for Social Sharing -->
    <meta property="og:title" content="$($post.title)">
    <meta property="og:description" content="$($post.description)">
    <meta property="og:type" content="article">
    <meta property="og:url" content="https://developermuthu.com/$($post.file)">
    <meta property="og:image" content="https://developermuthu.com/asset/img/blog/$($post.image)">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="800">
    <meta property="og:site_name" content="Eedhal Technology">
    <meta property="article:published_time" content="$($post.date)">
    <meta property="article:author" content="$($post.author)">
    <meta property="article:section" content="$($post.category)">
    
    <!-- Twitter Card Tags -->
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:title" content="$($post.title)">
    <meta name="twitter:description" content="$($post.description)">
    <meta name="twitter:image" content="https://developermuthu.com/asset/img/blog/$($post.image)">
"@
            
            # Add OG tags after description meta tag
            $content = $content -replace '(<meta name="description"[^>]+>)', "`$1$ogTags"
            
            Set-Content $filePath $content -NoNewline
            Write-Host "✅ Added OG tags to $($post.file)"
        } else {
            Write-Host "⏭️  OG tags already exist in $($post.file)"
        }
    } else {
        Write-Host "❌ File not found: $($post.file)"
    }
}

Write-Host "`n✅ Done! All blog posts now have Open Graph tags for social sharing."
