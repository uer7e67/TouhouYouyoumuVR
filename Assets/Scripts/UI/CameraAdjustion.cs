﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraAdjustion : MonoBehaviour
{
    public float distance;
    Transform camera;
    public GameObject[] canvases;

	void Start()
	{
		camera = GetComponentInChildren<Camera>().transform;
	}
    
    void Update()
    {
        camera.parent.localPosition = -camera.forward.normalized * distance;
        if(camera.parent.localPosition.z > 0)
            camera.parent.localPosition = new Vector3(camera.parent.localPosition.x, camera.parent.localPosition.y, 0f);
        foreach(GameObject canvas in canvases)
            canvas.transform.rotation = camera.rotation;
    }
}
