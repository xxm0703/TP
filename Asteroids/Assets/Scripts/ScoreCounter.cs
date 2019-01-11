using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ScoreCounter : MonoBehaviour
{
  void OnGUI()
  {
		var CurrentScore = GameStateController.Instance.GetCurrentScore();
    GUIStyle LabelStyle = GUI.skin.GetStyle("Label");
    LabelStyle.fontSize = 20;
    GUI.contentColor = Color.magenta;
    GUI.Label(new Rect(Screen.width - 100, 10, 100, 30), "Score: " + CurrentScore, LabelStyle);
  }
}
