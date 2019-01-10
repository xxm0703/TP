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
		Debug.Log("smth1");
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
