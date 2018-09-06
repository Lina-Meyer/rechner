class ErbschaftsrechnerController < ApplicationController
  def new
    @rechner = Erbschaftsrechner.new
  end

  def create
    @rechner = Erbschaftsrechner.new(rechner_params)

    if @rechner.verwandschaftsverhältniss == "Ehepartner" || @rechner.verwandschaftsverhältniss == "eingetragene Lebenspartner"
      @rechner.steuerklasse = 1
      @rechner.freibetrag = 500000
    elsif @rechner.verwandschaftsverhältniss == "Kinder, Stiefkinder"
      @rechner.steuerklasse = 1
      @rechner.freibetrag = 400000
    elsif @rechner.verwandschaftsverhältniss == "Enkel"
      @rechner.steuerklasse = 1
      @rechner.freibetrag = 200000
    elsif @rechner.verwandschaftsverhältniss == "Eltern & Großeltern"
      @rechner.steuerklasse = 1
      @rechner.freibetrag = 100000
    elsif @rechner.verwandschaftsverhältniss == "Geschwister, Neffen, weitere Verwandte"
      @rechner.steuerklasse = 2
      @rechner.freibetrag = 20000
    else
      @rechner.steuerklasse = 3
      @rechner.freibetrag = 20000
    end

    if @rechner.steuerklasse == 1
      if (@rechner.vermögen - @rechner.freibetrag) <= 75000
        @rechner.steuersatz = 7
      elsif (@rechner.vermögen - @rechner.freibetrag) >75000 && (@rechner.vermögen - @rechner.freibetrag) <= 300000
        @rechner.steuersatz = 11
      elsif (@rechner.vermögen - @rechner.freibetrag) >300000 && (@rechner.vermögen - @rechner.freibetrag) <= 600000
        @rechner.steuersatz = 15
      elsif (@rechner.vermögen - @rechner.freibetrag) >600000 && (@rechner.vermögen - @rechner.freibetrag) <= 6000000
        @rechner.steuersatz = 19
      elsif (@rechner.vermögen - @rechner.freibetrag) >6000000 && (@rechner.vermögen - @rechner.freibetrag) <= 13000000
        @rechner.steuersatz = 23
      elsif (@rechner.vermögen - @rechner.freibetrag) >13000000 && (@rechner.vermögen - @rechner.freibetrag) <= 26000000
        @rechner.steuersatz = 27
      elsif (@rechner.vermögen - @rechner.freibetrag) >26000000
        @rechner.steuersatz = 30
      end
    elsif @rechner.steuerklasse == 2
      if (@rechner.vermögen - @rechner.freibetrag) <= 75000
        @rechner.steuersatz = 15
      elsif (@rechner.vermögen - @rechner.freibetrag) > 75000 && (@rechner.vermögen - @rechner.freibetrag) <= 300000
        @rechner.steuersatz = 20
      elsif (@rechner.vermögen - @rechner.freibetrag )> 300000 && (@rechner.vermögen - @rechner.freibetrag) <= 600000
        @rechner.steuersatz = 25
      elsif (@rechner.vermögen - @rechner.freibetrag) > 600000 && (@rechner.vermögen - @rechner.freibetrag) <= 6000000
        @rechner.steuersatz = 30
      elsif (@rechner.vermögen - @rechner.freibetrag) > 6000000 && (@rechner.vermögen - @rechner.freibetrag) <= 13000000
        @rechner.steuersatz = 35
      elsif (@rechner.vermögen - @rechner.freibetrag) > 13000000 && (@rechner.vermögen - @rechner.freibetrag) <= 26000000
        @rechner.steuersatz = 40
      elsif (@rechner.vermögen - @rechner.freibetrag) > 26000000
        @rechner.steuersatz = 43
      end
    elsif @rechner.steuerklasse == 3
      if (@rechner.vermögen - @rechner.freibetrag) <= 75000
        @rechner.steuersatz = 30
      elsif (@rechner.vermögen - @rechner.freibetrag) > 75000 && (@rechner.vermögen - @rechner.freibetrag) <= 300000
        @rechner.steuersatz = 30
      elsif (@rechner.vermögen - @rechner.freibetrag )> 300000 && (@rechner.vermögen - @rechner.freibetrag) <= 600000
        @rechner.steuersatz = 30
      elsif (@rechner.vermögen - @rechner.freibetrag) > 600000 && (@rechner.vermögen - @rechner.freibetrag) <= 6000000
        @rechner.steuersatz = 30
      elsif (@rechner.vermögen - @rechner.freibetrag) > 6000000 && (@rechner.vermögen - @rechner.freibetrag) <= 13000000
        @rechner.steuersatz = 50
      elsif (@rechner.vermögen - @rechner.freibetrag) > 13000000 && (@rechner.vermögen - @rechner.freibetrag) <= 26000000
        @rechner.steuersatz = 50
      elsif (@rechner.vermögen - @rechner.freibetrag) > 26000000
        @rechner.steuersatz = 50
      end
    end

    if @rechner.save
      # if @rechner.steuerklasse == 1
      #   if @rechner.vermögen <= 75000
      #     @rechner.steuersatz = 7
      #   elsif @rechner.vermögen >75000 && <= 300000
      #     @rechner.steuersatz = 11
      #   elsif @rechner.vermögen >300000 && <= 600000
      #     @rechner.steuersatz = 15
      #   elsif @rechner.vermögen >600000 && <= 6000000
      #     @rechner.steuersatz = 19
      #   elsif @rechner.vermögen >6000000 && <= 13000000
      #     @rechner.steuersatz = 23
      #   elsif @rechner.vermögen >13000000 && <= 26000000
      #     @rechner.steuersatz = 27
      #   elsif @rechner.vermögen >26000000
      #     @rechner.steuersatz = 30
      #   end
      # elsif @rechner.steuerklasse == 2
      #   if @rechner.vermögen <= 75000
      #     @rechner.steuersatz = 15
      #   elsif @rechner.vermögen >75000 && <= 300000
      #     @rechner.steuersatz = 20
      #   elsif @rechner.vermögen >300000 && <= 600000
      #     @rechner.steuersatz = 25
      #   elsif @rechner.vermögen >600000 && <= 6000000
      #     @rechner.steuersatz = 30
      #   elsif @rechner.vermögen >6000000 && <= 13000000
      #     @rechner.steuersatz = 35
      #   elsif @rechner.vermögen >13000000 && <= 26000000
      #     @rechner.steuersatz = 40
      #   elsif @rechner.vermögen >26000000
      #     @rechner.steuersatz = 43
      #   end
      # elsif @rechner.steuerklasse == 3
      #   if @rechner.vermögen <= 75000
      #     @rechner.steuersatz = 30
      #   elsif @rechner.vermögen >75000 && <= 300000
      #     @rechner.steuersatz = 30
      #   elsif @rechner.vermögen >300000 && <= 600000
      #     @rechner.steuersatz = 30
      #   elsif @rechner.vermögen >600000 && <= 6000000
      #     @rechner.steuersatz = 30
      #   elsif @rechner.vermögen >6000000 && <= 13000000
      #     @rechner.steuersatz = 50
      #   elsif @rechner.vermögen >13000000 && <= 26000000
      #     @rechner.steuersatz = 50
      #   elsif @rechner.vermögen >26000000
      #     @rechner.steuersatz = 50
      #   end
      # end
      redirect_to erbschaftsrechner_path(@rechner)
    else
      render :new
    end
  end

  def show
    @rechner = Erbschaftsrechner.find(params[:id])
  end

  private

  def rechner_params
    params.require(:erbschaftsrechner).permit(:verwandschaftsverhältniss, :vermögen)
  end
end
