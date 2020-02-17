---
title: Quantifying the Impact of Cellular Heterogeneity on cGAS Pathway Regulation using Multiscale Agent-Based Modeling
event: AICHE
event_url: https://www.aiche.org/conferences/aiche-annual-meeting/2019

location: Hyatt Regency
address:
  street: 9801 International Dr
  city: Orlando
  region: FL
  postcode: '32819'
  country: United States

summary: Presented at the AICHE Annual Meeting (2019)
abstract: "Agent-based modeling is an extremely general computational technique that hinges on the idea of creating individual entities—or agents—containing rule sets that define how these agents interact with each other and the environment. In the case of systems immunology, these agents are defined as biological cells, and the rule sets provided dictate how cells coordinate immunological responses. The rules provided to a cellular agent can be simple, such as basic conditional logic, or complicated, such as using ordinary differential equations (ODEs) to track intracellular protein concentrations. The advantage of framing immunological responses into an agent-based model is that  it allows us to answer questions about population level behaviors that emerge from the interactions of single cells [1]. Recently developed experimental techniques like single cell RNA-seq [2] and high-resolution fluorescence microscopy [3] have shown that cell populations are heterogenous and respond differently to identical stimuli. This distribution of behavior is generally attributed to cells being at different points in cell cycle, having variable internal protein and mRNA concentrations, and depending on stochastic noise in gene expression [4]. Agent-based models can replicate these cellular states and simulate heterogeneous cell populations, improving over traditional ODE models that predict average cell responses over the entire population.
Using this agent-based modeling paradigm, we investigated the impact cell heterogeneity had on the cGAS pathway. The cGAS pathway is a signaling network responsible for the detection of pathogenic DNA [5]. Pathogens such as herpes simplex virus (HSV) [6] and mycobacterium tuberculosis (MTB) [7] insert their DNA into host cells which is recognized by the titular protein cGAS and induces the production of type I interferon. This cytokine leaves the infected cell, diffuses to neighboring cells, and binds onto cell receptors to activate downstream signaling pathways. Neighboring cells begin upregulating interferon stimulated genes (ISGs) that interfere with pathogenic proteins making them resistant to infection [8]. To recapitulate this behavior in an agent-based model, we introduced a rule set that categorized cells into four distinct states: healthy, infected, resistant, and dead. A cell population containing 40,000 agents was initially infected with an MOI of 10-3 using a Poisson distribution model. Cells transitioned from a healthy to an infected state depending on their proximity to infected agents. More infected neighbors increase the probability of becoming infected, thus allowing the infection to spread radially outward from the point of initiation. Infected cells produce interferon in accordance with our previously published ODE model of the cGAS pathway [9]. Healthy cells transition into resistant cells if they receive a sufficient interferon response produced by infected cells. Finally, cells enter a dead state after a set amount of time after infection, and the agent is removed from the simulation upon entering this state.  
Here, we use this model to determine what advantages or disadvantages exist for having either highly diverse cell populations or homogeneous populations. We show that there exists an optimum level of cell-to-cell variability (specifically, variation in the initial concentrations of the signaling proteins) in which cGAS-induced interferon signaling is strongly responsive, but not prone to aberrant levels of interferon. Such a state would be associated with either chronic inflammation (high levels of interferon) or rampant infection (low levels of interferon). Finally, we discuss future additions to the model, including how immune cell trafficking can be incorporated to capture higher order behavior of the immune response.
"

# Talk start and end times.
#   End time can optionally be hidden by prefixing the line with `#`.
date: "2019-11-12T08:00:00Z"
date_end: "2019-11-12T08:18:00Z"
all_day: false

# Schedule page publish date (NOT talk date).
publishDate: ""

authors: []
tags: []

# Is this a featured talk? (true/false)
featured: false

image:
  caption: 'Image credit: [**Unsplash**](https://unsplash.com/photos/bzdhc5b3Bxs)'
  focal_point: Right

links:
url_code: ""
url_pdf: ""
url_slides: "files/PresentionAICHE2019.pdf"
url_video: ""

# Markdown Slides (optional).
#   Associate this talk with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
slides: ""

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects:
- internal-project

# Enable math on this page?
math: true
---
