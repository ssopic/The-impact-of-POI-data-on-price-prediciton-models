# The Impact of POI Data on Price Prediction Models
Real estate price prediction has been a hot topic for countless years and will continue to be so. While
already being extensively researched the focus has only shifted towards the inclusion and study of
external influences, such as location on a property in the more recent years. Continuing with this trend
our thesis captured the influence of points of interest out of the Yelp database on our properties
dataset from King County, USA. Having to cope with the impressive size of the Yelp database this
thesis focussed mainly on the possible influential presence of 35 big categories of points of interest,
within certain ranges of a property and their corresponding ratings, on the price prediction model. The
analysis resulted in a list of important features in the surroundings of a property with the amount of
parks within 2 kilometres, the quality of home services within 2 kilometres, the amount of elementary
schools within 2 kilometres and the amount of gyms within 2 kilometres being the most important in
predicting the price of real estate value. These features improved model performance in both accuracy
and error values.

<img src="https://user-images.githubusercontent.com/73097560/115834477-dbab4500-a447-11eb-908a-139a6edaec5c.gif">
<img align="right" alt="rankings" src="https://raw.githubusercontent.com/ssopic/The-impact-of-POI-data-on-price-prediciton-models/refs/heads/main/convenience.png" width="550px" height="360px" />

## [Common real-estate mass price prediction (convenience) analysis](https://public.tableau.com/app/profile/silvio.sopic/viz/KCHousedatawithouttime-seriesinfo/Dashboard3)


The chart serves as a comprehensive tool for analyzing main variables in real estate data. Users can select X and Y variables, which can be nominal or continuous, and can also be left blank as needed. The X variable determines the bubble sizes in the map chart, while the Y variable defines the color intensity. The scatterplot to the right visualizes the relationship between the selected X and Y variables. The histogram is used to observe variable distribution, with the Y variable used for selection. A filter is available for showcasing various ranges of said variable on the other charts making it ideal for outlier observation. Finally, a boxplot is available at the bottom left, allowing the display of a single variable or combining a continuous variable with a nominal one to analyze the distribution based on the nominal variable.



### Summary
- Purpose of the Chart: Offers an all-in-one view of key variables used in real estate data analysis.
- Variable Selection: X and Y variables can be chosen and can be nominal, continuous, or left blank.
- Bubble Chart: Utilizes X variable for bubble sizes and Y for color intensity on the map chart.
- Scatterplot Explanation: Demonstrates the relationship between selected X and Y variables.
- Histogram Usage: Visualizes variable distribution, with Y variable serving for selection.
- Boxplot Functionality: Available at the bottom left, displays a single variable or combines continuous with nominal variables for distribution analysis.


<img src="https://user-images.githubusercontent.com/73097560/115834477-dbab4500-a447-11eb-908a-139a6edaec5c.gif">
<img align="left" alt="yelping around yelp categories" src="https://raw.githubusercontent.com/ssopic/The-impact-of-POI-data-on-price-prediciton-models/refs/heads/main/category_parent_alias.png" width="550px" height="360px" />

## [Yelp JSON Helper visualization summary](https://public.tableau.com/app/profile/silvio.sopic/viz/Yelpfusioncategoryhelper/Dashboard1)
Yelp Fusion API retrieves location and tags of various objects around a given latitude and longitude. The visualization represents tag structures. For instance, a restaurant can be labeled as a Mexican or Croatian restaurant, or both (fusion tag). The length of the bar chart indicates the tag count. Tags are crucial for comprehending specific object types during subsequent analysis.
<br>
<br>
<br>
<br>
<br>
<br>
<br>

### Summary:
- **Yelp Fusion API:** Utilized for obtaining location and tags of objects near specified coordinates.
- **Visualization Focus:** Highlights tag structures rather than specific locations.
- **Tag Structure Example:** Restaurants might have multiple tags like "Mexican," "Croatian," or a fusion of both tags.
- **Bar Chart Length:** Represents the tag count, providing insights into tag prevalence.
- **Significance of Tags:** Crucial for understanding object details in later analysis stages.
<img src="https://user-images.githubusercontent.com/73097560/115834477-dbab4500-a447-11eb-908a-139a6edaec5c.gif">
<img align="right" alt="rankings" src="https://raw.githubusercontent.com/ssopic/The-impact-of-POI-data-on-price-prediciton-models/refs/heads/main/ratings.png" width="550px" height="360px" />

## [Points of interest and their ranking](https://public.tableau.com/app/profile/silvio.sopic/viz/YelpingaroundKingsCountydoubleselector/Dashboard1)
Utilizing the Yelp Fusion application with latitude and longitude variables from the "convenience visualization" (but any mesh can be used) enables the understanding of specific elements' locations within a city. This information is crucial for interpreting geographical data, providing insights not only about the presence of locations like parks but also detailing their quality. For instance, distinguishing between a clean park and a dirty one impacts their respective surroundings differently. The visualization allows exploration of the surroundings of a selected location on a map. Filters on the left facilitate drill-down based on main tags from Yelp Fusion JSON. Certain brands may have multiple stores and their numbers and ratings are depicted on the treemap to the right. Further drill-down options are available in the filters below.

### Summary
- Yelp Fusion Application: Utilized with latitude and longitude variables for understanding city elements' whereabouts.
- Significance of Geographical Data: Provides insights into the quality of locations, not just their presence.
- Visualization Functionality: Explores surroundings based on a selected map location.
- Left Filters: Facilitate drill-down based on primary tags from Yelp Fusion JSON data.
- Prevalence of Specific Stores: Notable stores like convenience stores are more visible; their numbers and ratings are displayed on the treemap.
- Further Drill-Down: Available through filters below, allowing for deeper exploration and analysis.

<img src="https://user-images.githubusercontent.com/73097560/115834477-dbab4500-a447-11eb-908a-139a6edaec5c.gif">


## [Price prediction results visualization](https://public.tableau.com/app/profile/silvio.sopic/viz/RandomForestresults/Dashboard1)
<img align="right" alt="rankings" src="https://raw.githubusercontent.com/ssopic/The-impact-of-POI-data-on-price-prediciton-models/refs/heads/main/random%20forest%20results.png" width="550px" height="360px" />
The chart displays outcomes derived from a random-forest model aimed at identifying optimal variable combinations to enhance price prediction quality. It showcases several metrics such as Accuracy, Mean Absolute Error (MAE) in USD, Mean Squared Error (MSE), Root Mean Squared Error (RMSE), and R-squared. The varying combinations of variables exhibit diverse impacts on model improvement. Ultimately, utilizing all variables led to a significant enhancement across all factors.
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

### Summary:
- Random-Forest Model: Utilized to optimize variable combinations for improved price prediction.
- Observation of Results: Demonstrates how different variable combinations affect model performance.
- Utilization of All Variables: Indicates that employing all variables significantly improved all measured factors, signifying the comprehensive nature and effectiveness of including all available variables in enhancing price prediction quality.

- Metrics Included:
  - Accuracy: Measures the model's overall correctness in predictions.
  - Mean Absolute Error (MAE) in USD: Represents the average magnitude of errors in price prediction.
  - Mean Squared Error (MSE): Measures the average squared differences between predicted and actual prices.
  - Root Mean Squared Error (RMSE): Represents the square root of MSE, indicating the model's prediction error.
  - R-squared: Measures the proportion of variance in price explained by the model.
<img src="https://user-images.githubusercontent.com/73097560/115834477-dbab4500-a447-11eb-908a-139a6edaec5c.gif">

## [Price prediction features](https://public.tableau.com/app/profile/silvio.sopic/viz/WorkInProgress_16198790017670/4maps2_0)
<img align="right" alt="rankings" src="https://raw.githubusercontent.com/ssopic/The-impact-of-POI-data-on-price-prediciton-models/refs/heads/main/price%20prediction%20features.png" width="550px" height="360px" />
The chart illustrates the most influential features contributing to the prediction of real estate prices. These features encompass a blend of geographical attributes, some of which are continuous variables (such as the quantity of bars within a 50-meter radius of the real estate), while others are nominal (like the average quality score of these bars, transformed into an ordinal variable). Notably, the visualization also sheds light on specific city areas with larger real estate properties or those holding various other crucial intrinsic features. For optimal viewing, it is recommended to set one continuous selector to price and modify the other selector to observe variations and discern disparities.
<br>
<br>
<br>

### Summary:
- Influential Features Identification: Highlights features with significant impact on real estate price prediction.
- Nature of Features:
  - Continuous Variables: Includes geographical factors like the quantity of nearby bars.
  - Nominal Variables: Incorporates categorical attributes, e.g., quality scores transformed into ordinal variables.
- City Area Insights: Offers insights into areas with larger real estate properties and other notable intrinsic features.
- Recommended Viewing:
  - Suggested setting one continuous selector to price for comparison.
  - Modify the other selector to observe variations in influential features, aiding in discerning patterns and disparities affecting real estate prices.

<img src="https://user-images.githubusercontent.com/73097560/115834477-dbab4500-a447-11eb-908a-139a6edaec5c.gif">
