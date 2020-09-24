package com.intime.feria.dao;

import java.util.List;

import com.intime.feria.vo.CTImage;

public interface CTImagesDAO {
	public List<CTImage> selectRandomCityImg(int cityImgNo);
}
