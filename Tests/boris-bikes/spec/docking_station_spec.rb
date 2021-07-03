require 'docking_station'

describe DockingStation do
    it { is_expected.to respond_to :release_bike }

    it {is_expected.to respond_to(:dock).with(1).argument }

    it { is_expected.to respond_to(:bike) } 

    it 'releases working bikes' do
        b = Bike.new
        subject.dock(b)
        bike = subject.release_bike
        expect(bike).to be_working
    end

    it 'docks a bike' do
        bike = Bike.new
        expect(subject.dock(bike)).to eq bike
    end

    it 'returns docked bikes' do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.bike).to eq bike
    end

    describe '#release_bike' do
        it 'releases a docked bike' do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.release_bike).to eq bike
        end
    end

    describe '#release_bike' do
        it 'raises an error when there are no bikes available' do
        expect { subject.release_bike }.to raise_error 'No Bikes Available'
        end
    end
end

