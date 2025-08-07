String getHealthGoal(double bmi, int age) {
  if (bmi < 18.5) {
    return "🏋️‍♂️ Gain 3–5 kg over the next 2 months with a high-protein diet.";
  } else if (bmi < 24.9) {
    return "🧘 Maintain your current weight with regular exercise and balanced meals.";
  } else if (bmi < 29.9) {
    return "🚴‍♀️ Lose 4–6 kg in 3 months through cardio and portion control.";
  } else {
    return "🩺 Consult a nutritionist. Aim to lose 8–10 kg gradually with a structured plan.";
  }
}
