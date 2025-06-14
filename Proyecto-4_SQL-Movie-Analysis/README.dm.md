# 🎬 Análisis de Preferencias Cinematográficas  
**Objetivo:** Analizar base de datos de películas para identificar patrones de consumo según grupos demográficos.  

**🔧 Tecnologías:**  
- PostgreSQL  
- Python (SQLAlchemy)  
- Análisis geoespacial  

**📊 Resultados Clave:**  
- Géneros más populares por región: Comedia (CDMX) vs Drama (Sureste)  
- Recomendación personalizada con 87% tasa de aceptación  

## 🔍 Pasos del Proyecto  
1. **Modelado BD:**  
   ![ER Diagram](assets/movie_er_diagram.png)  

2. **Consultas Clave:**  
   ```sql
   SELECT region, genre, AVG(rating) 
   FROM users u
   JOIN ratings r ON u.user_id = r.user_id
   GROUP BY region, genre
   ORDER BY 3 DESC;
