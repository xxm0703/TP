using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class GameStateController : MonoBehaviour {

	public float GameOverScreenDelay = 2.0f;
	public string GameOverScene = "GameOver";
  public static GameStateController Instance { get; private set; }
	private uint CurrentScore = 0;
  private int coins;
	void Awake()
	{
		if (Instance == null)
		{
			Instance = this;
			DontDestroyOnLoad (gameObject);
		}
		else
		{
			Destroy(gameObject);
		}
    coins = PlayerPrefs.GetInt("coins");
	}

	public void OnPlayerSpawned()
	{
		CurrentScore = 0;
	}

	public void OnPlayerDied()
	{
    coins += (int)CurrentScore / 10;
    PlayerPrefs.SetInt("coins", coins);
		Invoke ("ShowGameOverScreen", GameOverScreenDelay);
	}

	public void IncrementScore(uint scoreToAdd)
	{
		CurrentScore += scoreToAdd;
	}
	public uint GetCurrentScore()
	{
		return CurrentScore;
	}

	void ShowGameOverScreen()
	{
		SceneManager.LoadScene (GameOverScene);
	}
}
