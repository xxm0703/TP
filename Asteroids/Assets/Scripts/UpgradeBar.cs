using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class UpgradeBar : MonoBehaviour
{
	public Image bar = null;
  private int coins, shield;
  public int BASE = 100;
  public const int LEVELS = 5;
  /*
  I know is extremely dumb to use PlayerPrefs, but I don't have enough time
  And in this case it's singleplayer, so it wouldn't be a problem ;)
  */
  void Start()
  {
    coins = PlayerPrefs.GetInt("coins");
    shield = PlayerPrefs.GetInt("shield");
    // PlayerPrefs.SetInt("shield", 0);
    if (bar)
      bar.fillAmount = (1f / LEVELS) * shield;
  }

	public void Increment()
	{
		if (bar)
		{


      if (coins >= (shield + 1) * BASE)
      {
        PlayerPrefs.SetInt("shield",  shield + 1);
        bar.fillAmount += 0.2f;
        PlayerPrefs.SetInt("coins",  coins - (shield + 1) * BASE);
      }
		}
	}

  void OnGUI()
  {
    GUIStyle LabelStyle = GUI.skin.GetStyle("Label");
    LabelStyle.fontSize = 20;
    GUI.contentColor = Color.magenta;
    GUI.Label(new Rect(Screen.width - 100, 10, 100, 30), "Coins: " + coins, LabelStyle);
  }
}
