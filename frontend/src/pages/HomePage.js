import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { db } from '../firebaseConfig'; // <-- Note the '../'
import { collection, getDocs, query, orderBy } from 'firebase/firestore';
import '../App.css'; // <-- Note the '../'

function HomePage() {
  const [articles, setArticles] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    // ... (Your fetchArticles function is perfect, no changes) ...
    const fetchArticles = async () => {
      setLoading(true);
      const articlesRef = collection(db, "articles");
      const q = query(articlesRef, orderBy("createdAt", "desc"));
      const querySnapshot = await getDocs(q);
      const articlesList = querySnapshot.docs.map(doc => ({
        id: doc.id,
        ...doc.data()
      }));
      setArticles(articlesList);
      setLoading(false);
    };
    fetchArticles();
  }, []);

  return (
    <div className="homepage-container">
      {/* --- YOUR NEW HEADER IMAGE --- */}
      <div className="homepage-header-image">
        <div className="header-text">
          <h1>Your Name Photography</h1>
          <p>A portfolio of light and shadow.</p>
        </div>
      </div>

      <main className="homepage-content">
        <h2>Latest Articles</h2>
        {loading ? (
          <p>Loading articles...</p>
        ) : (
          <div className="article-list">
            {articles.map(article => (
              <div className="article-card-wrapper" key={article.id}>
                <Link to={`/article/${article.id}`} className="article-card">
                  {/* ... (Article card content is unchanged) ... */}
                  {article.missionImages && Object.values(article.missionImages)[0] ? (
                    <img 
                      src={Object.values(article.missionImages)[0]} 
                      alt={article.title} 
                      className="article-card-image" 
                    />
                  ) : (
                    <div className="article-card-image-placeholder" />
                  )}
                  <h3>{article.title}</h3>
                </Link>
                {/* We'll add the edit link back later inside the protected route */}
              </div>
            ))}
          </div>
        )}
      </main>
    </div>
  );
}

export default HomePage;