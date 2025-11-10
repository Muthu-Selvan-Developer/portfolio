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
        title = "React Native vs Flutter: Choosing the Right Framework"
        description = "A comprehensive comparison of React Native and Flutter for cross-platform mobile development."
        image = "post-2.jpg"
        date = "2025-03-08"
        author = "Sugan"
        category = "App Development"
    },
    @{
        file = "blog-post-unity.html"
        title = "Unity Performance Optimization Tips for Mobile Games"
        description = "Essential techniques to optimize your Unity games for better performance on mobile devices."
        image = "post-3.jpg"
        date = "2025-03-05"
        author = "Sugan"
        category = "Game Development"
    },
    @{
        file = "blog-post-seo.html"
        title = "SEO Strategies That Actually Work in 2025"
        description = "Discover the latest SEO techniques and strategies to improve your website's search rankings."
        image = "post-4.jpg"
        date = "2025-03-03"
        author = "Sugan"
        category = "Digital Marketing"
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
