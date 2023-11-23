
function mapClick(buttonId, articleId){
    const button = document.getElementById(buttonId);
    const article = document.getElementById(articleId);
    
    const articles = document.querySelectorAll('.articles .article');
    console.log(articles);

    articles.forEach((article) => {
        article.style.display = 'none';
    });

    article.style.display = 'block';
    

}
