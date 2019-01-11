using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class GameOverMenuHandler : MonoBehaviour {

	public string GameScene = "Main";
	public string ShopScene = "Shop";
	public string GameOverScene = "GameOver";

	public void RestartGame()
	{
		SceneManager.LoadScene(GameScene);
	}

	public void EnterShop()
	{
		SceneManager.LoadScene(ShopScene);
	}

	public void GameOver()
	{
		SceneManager.LoadScene(GameOverScene);
	}

	public void QuitGame()
	{
		Application.Quit();
	}
}
