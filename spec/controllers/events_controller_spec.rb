require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe EventsController do

  # This should return the minimal set of attributes required to create a valid
  # Event. As you add validations to Event, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { title: 'Some Event' } }
  let(:invalid_attributes) { { title: '' } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EventsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all events as @events" do
      event = Event.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:events)).to eq([event])
    end
  end

  describe "GET show" do
    it "assigns the requested event as @event" do
      event = Event.create! valid_attributes
      get :show, {:id => event.to_param}, valid_session
      expect(assigns(:event)).to eq(event)
    end
  end
  
  describe "GET search" do
    let(:timeline) { create(:timeline) }
    let(:some_event) { create(:event, title: 'Some Event') }
    let(:some_other_event) { create(:event, title: 'Some Other Event') }
    let(:yet_another_event) { create(:event, title: 'Yet Another Event') }
    
    it "searches for all events matching the query" do
      get :search, {:timeline_id => timeline.id, :query => 'other event'}, valid_session
      expect(assigns(:events)).to eq([some_other_event, yet_another_event])
    end
  end
  
  describe "POST add" do
    let (:timeline) { create(:timeline) }
    let (:event) { create(:event) }
    
    it "adds the event to the timeline" do
      post :add, {:timeline_id => timeline.id, :id => event.to_param}, valid_session  
      expect(timeline.events).to eq([event])
    end
    
    it "redirects to the timeline" do
      post :add, {:timeline_id => timeline.id, :id => event.to_param}, valid_session  
      expect(response).to redirect_to(timeline)
    end
  end

  describe "GET new" do
    it "assigns a new event as @event" do
      get :new, {}, valid_session
      expect(assigns(:event)).to be_a_new(Event)
    end
  end

  describe "GET edit" do
    it "assigns the requested event as @event" do
      event = Event.create! valid_attributes
      get :edit, {:id => event.to_param}, valid_session
      expect(assigns(:event)).to eq(event)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      context "when there is no timeline_id" do
        it "creates a new Event" do
          expect {
            post :create, {:event => valid_attributes}, valid_session
          }.to change(Event, :count).by(1)
        end

        it "assigns a newly created event as @event" do
          post :create, {:event => valid_attributes}, valid_session
          expect(assigns(:event)).to be_a(Event)
          expect(assigns(:event)).to be_persisted
        end

        it "redirects to the created event" do
          post :create, {:event => valid_attributes}, valid_session
          expect(response).to redirect_to(Event.last)
        end
      end
      
      context "when there is a timeline_id" do
        let (:timeline) { create(:timeline) }
        
        it "creates a new Event" do
          expect {
            post :create, {:timeline_id => timeline.id, :event => valid_attributes}, valid_session
          }.to change(Event, :count).by(1)
        end
        
        it "assigns a newly created event as @event" do
          post :create, {:timeline_id => timeline.id, :event => valid_attributes}, valid_session
          expect(assigns(:event)).to be_a(Event)
          expect(assigns(:event)).to be_persisted
        end
        
        it "assigns the timeline to @timeline and adds the event" do
          post :create, {:timeline_id => timeline.id, :event => valid_attributes}, valid_session
          expect(assigns(:timeline)).to be_a(Timeline)
          expect(assigns(:timeline)).to be_persisted
          expect(assigns(:timeline).events).to eq([assigns(:event)])
        end
        
        it "redirects to the timeline" do
          post :create, {:timeline_id => timeline.id, :event => valid_attributes}, valid_session
          expect(response).to redirect_to(timeline)
        end
      end
    end

    describe "with invalid params" do
      context "when there is no timeline_id" do
        it "assigns a newly created but unsaved event as @event" do
          post :create, {:event => invalid_attributes}, valid_session
          expect(assigns(:event)).to be_a_new(Event)
        end

        it "re-renders the 'new' template" do
          post :create, {:event => invalid_attributes}, valid_session
          expect(response).to render_template("new")
        end
      end
      
      context "when there is a timeline_id" do
        let (:timeline) { create(:timeline) }
        
        it "assigns a newly created but unsaved event as @event" do
          post :create, {:timeline_id => timeline.id, :event => invalid_attributes}, valid_session
          expect(assigns(:event)).to be_a_new(Event)
        end

        it "re-renders the 'new' template" do
          post :create, {:timeline_id => timeline.id, :event => invalid_attributes}, valid_session
          expect(response).to render_template("new")
        end
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested event" do
        event = Event.create! valid_attributes
        # Assuming there are no other events in the database, this
        # specifies that the Event created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(Event).to receive(:update).with({ "date" => "2013-12-30 22:45:43" })
        put :update, {:id => event.to_param, :event => { "date" => "2013-12-30 22:45:43" }}, valid_session
      end

      it "assigns the requested event as @event" do
        event = Event.create! valid_attributes
        put :update, {:id => event.to_param, :event => valid_attributes}, valid_session
        expect(assigns(:event)).to eq(event)
      end

      it "redirects to the event" do
        event = Event.create! valid_attributes
        put :update, {:id => event.to_param, :event => valid_attributes}, valid_session
        expect(response).to redirect_to(event)
      end
    end

    describe "with invalid params" do
      it "assigns the event as @event" do
        event = Event.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Event.any_instance.stub(:save).and_return(false)
        put :update, {:id => event.to_param, :event => { "date" => "invalid value" }}, valid_session
        expect(assigns(:event)).to eq(event)
      end

      it "re-renders the 'edit' template" do
        event = Event.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Event.any_instance.stub(:save).and_return(false)
        put :update, {:id => event.to_param, :event => { "date" => "invalid value" }}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested event" do
      event = Event.create! valid_attributes
      expect {
        delete :destroy, {:id => event.to_param}, valid_session
      }.to change(Event, :count).by(-1)
    end

    it "redirects to the events list" do
      event = Event.create! valid_attributes
      delete :destroy, {:id => event.to_param}, valid_session
      expect(response).to redirect_to(events_url)
    end
  end

end
