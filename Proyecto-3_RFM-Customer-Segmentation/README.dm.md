# 🛒 Segmentación RFM para E-commerce  
**Objetivo:** Clasificar clientes usando metodología RFM (Recency, Frequency, Monetary) para optimizar campañas de marketing.  

**🔧 Tecnologías:**  
- Python (pandas, scikit-learn)  
- Clustering (K-means, DBSCAN)  
- Power BI para dashboards  

**📊 Resultados Clave:**  
- Identificación de 5 segmentos estratégicos  
- Reducción de 22% en costos de marketing al priorizar "Campeones"  

## 🔍 Pasos del Proyecto  
1. **Cálculo RFM:**  
   ```python
   df['Recency'] = (today - df['LastPurchase']).dt.days
   df['Frequency'] = df.groupby('CustomerID')['Invoice'].transform('count')
   