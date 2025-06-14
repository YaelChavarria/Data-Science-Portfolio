# 📊 Dashboard COVID-19 para América Latina  
**Objetivo:** Visualizar evolución de pandemia (2020-2023) con enfoque en patrones regionales latinoamericanos.  

**🔧 Tecnologías:**  
- Power BI (DAX, Power Query)  
- Python (geopandas)  
- Azure Data Factory  

**📊 Resultados Clave:**  
- Detección de olas pandémicas 2 semanas antes que reportes oficiales  
- Modelo predictivo con 92% precisión  

## 🔍 Pasos del Proyecto  
1. **ETL:**  
   - Integración de 12 fuentes oficiales  
   - Limpieza con expresiones regulares para formatos diversos  

2. **Modelado:**  
   - Cálculo Rt (tasa de contagio) con DAX:  
   ```dax
   Rt = 
   VAR Cases = SUM(Data[Cases])
   RETURN
   DIVIDE(Cases, CALCULATE(Cases, DATEADD(Data[Date], -7, DAY)))
