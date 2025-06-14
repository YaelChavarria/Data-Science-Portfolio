# 🚀 Análisis de Apps de Google Play Store  
**Objetivo:** Identificar las aplicaciones mejor valoradas mediante análisis de 10K apps y +100 reseñas, detectando patrones culturales en preferencias de usuarios hispanohablantes.  

**🔧 Tecnologías:**  
- Python (pandas, numpy, matplotlib)  
- NLP (Análisis de sentimiento en español)  
- Google Colab  

**📊 Resultados Clave:**  
- Identificación de 3 categorías dominantes con rating >4.5 estrellas  
- Detección de sesgos regionales: Apps de productividad 37% más populares en México que en España  

## 🔍 Pasos del Proyecto  
1. **Limpieza de datos:**  
   - Normalización de reseñas multilingües (español/portugués)  
   - Manejo de valores nulos con interpolación  

2. **Análisis:**  
   - Clustering de categorías usando K-means  
   - Análisis de sentimiento con librería `TextBlob-es`  

3. **Visualización:**  
   - Mapa de calor de correlación entre rating y características técnicas  
   ```python
   import seaborn as sns
   sns.heatmap(df.corr(), annot=True)
