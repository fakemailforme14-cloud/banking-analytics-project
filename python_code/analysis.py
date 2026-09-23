import pandas as pd
import numpy as np
import plotly.express as px


path = r"C:\Users\tkbv1\OneDrive\Desktop\פרוייקט Banking Transactions Dataset\Banking_Analytics.xlsx.xlsx"

customers = pd.read_excel(path, sheet_name="customers")
accounts = pd.read_excel(path, sheet_name="accounts")
cards = pd.read_excel(path, sheet_name="cards")
loans = pd.read_excel(path, sheet_name="loans")
loan_payments = pd.read_excel(path, sheet_name="loan_payments")
branches = pd.read_excel(path, sheet_name="branches")
employees = pd.read_excel(path, sheet_name="employees")
support_tickets = pd.read_excel(path, sheet_name="support_tickets")





merged = loan_payments.merge(loans, on="loan_id", how="left")
merged = merged.merge(customers, on="customer_id", how="left")


from sklearn.ensemble import RandomForestClassifier

model = RandomForestClassifier(
    n_estimators=100,
    random_state=42,
    class_weight="balanced")

from sklearn.model_selection import train_test_split

X = merged[["credit_score", "annual_income", "loan_amount", "interest_rate"]]
y = merged["late_payment_flag"]

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42, stratify=y)

model.fit(X_train, y_train)

y_pred = model.predict(X_test)

from sklearn.metrics import accuracy_score

accuracy = accuracy_score(y_test, y_pred)
print(f"Accuracy: {accuracy:.3f}")

from sklearn.metrics import classification_report

print(classification_report(y_test, y_pred))

from sklearn.metrics import confusion_matrix

print(confusion_matrix(y_test, y_pred))


importances = model.feature_importances_
features = X.columns

for name, imp in zip(features, importances):
    print(f"{name}: {imp:.3f}")