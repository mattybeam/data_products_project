shinyUI(pageWithSidebar(
    headerPanel("Watch Your Money GROW!"),
    sidebarPanel(
        sliderInput('r_N', 'Nominal Interest Rate (%)', min = 0, max = 1, value = 0.07, step = 0.01),
        sliderInput("inflation", "Inflation Rate (%)",min = 0, max = 1, value = 0.03, step = 0.01),
        sliderInput("Y","Years Until Retirement",min = 0, max = 100, value = 30,step = 1),
        sliderInput("deposit","Deposit Per Period ($)",min = 0, max = 10000, value = 10, step = 5),
        sliderInput("periods","Payment Periods per Year",min = 0, max = 36, value = 12, step = 1)
    ),
    mainPanel(
        tabsetPanel(
            tabPanel("Documentation", includeHTML("Money_Growth_Documentation.html")), 
            tabPanel("Results", h4('Real Interest Rate (%):'),
                     textOutput('r'),
                     h4('Present Value of Retirement Savings ($):'),
                     textOutput("PV"),
                     h4('Value of Savings at Retirement ($):'),
                     textOutput("FV"))
        )
    )
))