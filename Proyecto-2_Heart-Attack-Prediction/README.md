# ❤️ Sistema de Predicción de Riesgo Cardíaco  
**Objetivo:** Predecir probabilidad de ataques cardíacos y recomendar fármacos personalizados para 3 perfiles de pacientes.  

**🔧 Tecnologías:**  
- Python (scikit-learn, imbalanced-learn)  
- Machine Learning (Random Forest, XGBoost)  
- SHAP para interpretabilidad  

**📊 Resultados Clave:**  
- Modelo con 89% precisión (AUC: 0.92)  
- Sistema de recomendación farmacológica con 95% efectividad  

## 🔍 Pasos del Proyecto  
1. **Preprocesamiento:**  
   - Oversampling con SMOTE para datos desbalanceados  
   - Escalado RobustScaler para variables clínicas  

2. **Modelado:**  
   ```python
   from xgboost import XGBClassifier
   model = XGBClassifier(use_label_encoder=False)
   model.fit(X_train, y_train)
   