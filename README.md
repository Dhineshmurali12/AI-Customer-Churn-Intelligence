# AI Customer Churn Intelligence

An end-to-end customer churn intelligence system that combines **Machine Learning, SHAP Explainability, Large Language Models (LLMs), and Power BI** to predict customer churn, explain the key drivers, prioritize retention efforts, and generate actionable retention recommendations.

---

## 🎯 Project Overview

Customer churn is a major challenge for subscription-based businesses. Predicting which customers are likely to leave is useful, but prediction alone does not explain **why** a customer may churn or **what the business should do next**.

This project addresses that problem through an end-to-end AI-powered churn intelligence pipeline.

The system follows:

**Predict → Explain → Prioritize → Recommend → Visualize**

### The system provides:

- Customer churn probability prediction
- Customer risk classification
- SHAP-based model explainability
- Retention priority classification
- LLM-powered retention recommendations
- Customer-level drill-through analysis
- Interactive Power BI dashboard
- Business-focused customer insights

---

## 🏗️ System Architecture

```text
Customer Data
      │
      ▼
Data Cleaning & Feature Engineering
      │
      ▼
SQL Business Analysis
      │
      ▼
Machine Learning Model
      │
      ├──────────────► Churn Probability
      │
      ▼
SHAP Explainability
      │
      ├──────────────► Top Churn Drivers
      │
      ▼
Risk Classification
      │
      ▼
Retention Priority
      │
      ▼
LLM Retention Recommendations
      │
      ▼
Power BI Dashboard
---

## 📊 Power BI Dashboard

### Executive Overview

The executive dashboard provides a high-level view of customer churn, including total customers, churn rate, churned customers, high-risk customers, and behavioral churn patterns.

![Executive Overview](dashboard_images/01_executive_overview.png)

### AI Risk & Customer Intelligence

This dashboard combines ML churn predictions, customer risk classification, churn probability distribution, retention priority, and customer-level risk factors.

![AI Risk & Customer Intelligence](dashboard_images/02_ai_risk_customer_intelligence.png)

### Customer Intelligence Detail

Customer-level analysis enables drill-through investigation of individual customers, their churn probability, risk category, behavioral factors, and retention priority.

![Customer Intelligence Detail](dashboard_images/03_customer_intelligence_detail.png)
---

## 📄 Project Report

A detailed project report covering the methodology, machine learning pipeline, SHAP explainability, LLM-based recommendations, and Power BI dashboard.

[View Project Report](reports/AI%20Customer%20Churn%20Intelligence.pdf)
